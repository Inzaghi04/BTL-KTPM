using System.Windows;
using System.Windows.Controls;
using GMap.NET;
using GMap.NET.WindowsPresentation;
using GMap.NET.MapProviders;

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
            MainMap.MapProvider = GMapProviders.GoogleMap;
            MainMap.Position = new PointLatLng(21.028511, 105.804817);
            MainMap.MinZoom = 0;
            MainMap.MaxZoom = 24;
            MainMap.Zoom = 10;
            MainMap.MouseWheelZoomType = MouseWheelZoomType.MousePositionAndCenter;
            MainMap.CanDragMap = true;
            MainMap.DragButton = System.Windows.Input.MouseButton.Left;
        }

        // Xử lý sự kiện click nút Thoát
        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            // Nếu MapView là UserControl, bạn có thể ẩn nó hoặc raise một event cho cha xử lý
            this.Visibility = Visibility.Collapsed;
            // Hoặc nếu muốn raise một sự kiện cho cha đóng hẳn View này:
            // (Tùy vào kiến trúc, có thể dùng Event, Delegate, hoặc Command để báo cha)
        }
    }
}