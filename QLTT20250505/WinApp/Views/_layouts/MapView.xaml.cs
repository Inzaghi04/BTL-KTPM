using System;
using System.Data;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;
using GMap.NET;
using GMap.NET.MapProviders;
using GMap.NET.WindowsPresentation;

namespace WinApp.Views._layouts
{
    public partial class MapView : UserControl
    {
        public MapView()
        {
            InitializeComponent();
            LoadMap();
        }

        private void LoadMap()
        {
            // Khởi tạo bản đồ
            MainMap.MapProvider = GMapProviders.GoogleMap;
            GMaps.Instance.Mode = AccessMode.ServerOnly;
            MainMap.Position = new PointLatLng(21.028511, 105.804817); // Trung tâm Hà Nội
            MainMap.MinZoom = 5;
            MainMap.MaxZoom = 18;
            MainMap.Zoom = 10;
            MainMap.MouseWheelZoomType = MouseWheelZoomType.MousePositionAndCenter;
            MainMap.CanDragMap = true;
            MainMap.DragButton = System.Windows.Input.MouseButton.Left;
            MainMap.ShowCenter = false;

            // Xóa marker cũ (nếu có)
            MainMap.Markers.Clear();

            // Tạo bảng chú thích
            CreateLegend();

            // Lấy dữ liệu các điểm từ BanDoPhanBo, bao gồm SinhVatGayHai
            var dt = Provider.Load(@"
            SELECT 
                b.ID,
                CASE 
                    WHEN b.CoSoID IS NOT NULL THEN c.TenCoSo 
                    WHEN b.VungTrongTrotID IS NOT NULL AND sv.ID IS NOT NULL THEN sv.TenSinhVat
                    ELSE v.TenVungTrongTrot 
                END AS Ten,
                b.KinhDo, 
                b.ViDo,
                CASE 
                    WHEN b.CoSoID IS NOT NULL THEN l.TenLoaiCoSo 
                    WHEN b.VungTrongTrotID IS NOT NULL AND sv.ID IS NOT NULL THEN sv.LoaiSinhVat
                    ELSE N'Vùng trồng trọt' 
                END AS Loai,
                sv.MoTa AS MoTa,
                sv.NgayPhatHien AS NgayPhatHien
            FROM BanDoPhanBo b
            LEFT JOIN CoSo c ON b.CoSoID = c.ID
            LEFT JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
            LEFT JOIN VungTrongTrot v ON b.VungTrongTrotID = v.ID
            LEFT JOIN SinhVatGayHai sv ON v.ID = sv.VungTrongTrotID
        ");

            // Thêm marker cho từng điểm
            foreach (DataRow row in dt.Rows)
            {
                double lat = Convert.ToDouble(row["ViDo"]);
                double lng = Convert.ToDouble(row["KinhDo"]);
                string ten = row["Ten"].ToString();
                string loai = row["Loai"].ToString();
                string moTa = row["MoTa"] != DBNull.Value ? row["MoTa"].ToString() : string.Empty;
                string ngayPhatHien = row["NgayPhatHien"] != DBNull.Value ? Convert.ToDateTime(row["NgayPhatHien"]).ToString("yyyy-MM-dd") : string.Empty;

                // Chọn màu marker dựa trên loại
                Brush markerColor;
                if (loai == "Trang trại trồng trọt")
                {
                    markerColor = Brushes.Green;
                }
                else if (loai == "Cơ sở giết mổ")
                {
                    markerColor = Brushes.Red;
                }
                else if (loai == "Nhà máy chế biến thức ăn trồng trọt")
                {
                    markerColor = Brushes.Blue;
                }
                else if (loai == "Cơ sở xử lý chất thải")
                {
                    markerColor = Brushes.Purple;
                }
                else if (loai == "Vùng trồng trọt")
                {
                    markerColor = Brushes.Orange;
                }
                else if (loai == "Sâu hại" || loai == "Côn trùng" || loai == "Nấm bệnh" || loai == "Động vật có hại")
                {
                    markerColor = Brushes.Black; // Màu đen cho sinh vật gây hại
                }
                else
                {
                    markerColor = Brushes.Gray;
                }

                // Tạo tooltip chi tiết
                string tooltipText = $"{ten} ({loai})";
                if (!string.IsNullOrEmpty(moTa) && !string.IsNullOrEmpty(ngayPhatHien))
                {
                    tooltipText += $"\nMô tả: {moTa}\nNgày phát hiện: {ngayPhatHien}";
                }
                else if (!string.IsNullOrEmpty(moTa))
                {
                    tooltipText += $"\nMô tả: {moTa}";
                }

                // Tạo chấm (Ellipse) cho marker
                var ellipse = new Ellipse
                {
                    Width = 16,
                    Height = 16,
                    Stroke = markerColor,
                    StrokeThickness = 2,
                    Fill = markerColor,
                    Opacity = 0.8,
                    ToolTip = tooltipText
                };

                // Tạo marker với tọa độ
                var marker = new GMapMarker(new PointLatLng(lat, lng))
                {
                    Shape = ellipse,
                    Offset = new System.Windows.Point(-8, -8)
                };

                MainMap.Markers.Add(marker);
            }
        }

        private void CreateLegend()
        {
            // Xóa nội dung cũ trong LegendPanel (nếu có)
            LegendPanel.Children.Clear();

            // Thêm tiêu đề
            LegendPanel.Children.Add(new TextBlock
            {
                Text = "Chú thích",
                FontWeight = FontWeights.Bold,
                FontSize = 14,
                Margin = new Thickness(0, 0, 0, 8)
            });

            // Danh sách các loại và màu tương ứng
            var legendItems = new[]
            {
            new { Type = "Trang trại trồng trọt", Color = Brushes.Green },
            new { Type = "Cơ sở giết mổ", Color = Brushes.Red },
            new { Type = "Nhà máy chế biến thức ăn trồng trọt", Color = Brushes.Blue },
            new { Type = "Cơ sở xử lý chất thải", Color = Brushes.Purple },
            new { Type = "Vùng trồng trọt", Color = Brushes.Orange },
            new { Type = "Sinh vật gây hại", Color = Brushes.Black },
            new { Type = "Khác", Color = Brushes.Gray }
        };

            // Thêm từng mục chú thích
            foreach (var item in legendItems)
            {
                var stackPanel = new StackPanel
                {
                    Orientation = Orientation.Horizontal,
                    Margin = new Thickness(0, 2, 0, 2)
                };

                // Thêm hình tròn màu
                var ellipse = new Ellipse
                {
                    Width = 12,
                    Height = 12,
                    Fill = item.Color,
                    Stroke = item.Color,
                    StrokeThickness = 1,
                    Margin = new Thickness(0, 0, 8, 0),
                    VerticalAlignment = VerticalAlignment.Center
                };

                // Thêm text mô tả
                var textBlock = new TextBlock
                {
                    Text = item.Type,
                    FontSize = 12,
                    VerticalAlignment = VerticalAlignment.Center
                };

                stackPanel.Children.Add(ellipse);
                stackPanel.Children.Add(textBlock);
                LegendPanel.Children.Add(stackPanel);
            }
        }

        // Xử lý sự kiện click nút Thoát
        public static class AppHelper
        {
            public static void RedirectToAction(string action, string controller, params object[] args)
            {
                App.Request($"{controller}/{action}", args);
            }
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            var mainWindow = Window.GetWindow(this) as MainWindow;
            if (mainWindow != null)
            {
                AppHelper.RedirectToAction("index", "GiongCay");
            }
        }
    }
}