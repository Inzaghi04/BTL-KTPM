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