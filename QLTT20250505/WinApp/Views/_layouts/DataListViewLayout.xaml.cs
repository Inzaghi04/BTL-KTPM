using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WinApp.Views
{
    /// <summary>
    /// Interaction logic for DataListViewLayout.xaml
    /// </summary>
    public partial class DataListViewLayout : UserControl, ILayout
    {
        private IEnumerable<object> _originalItems; // Store the original items for resetting the search

        public void Render(ViewContext context)
        {
            var grid = (Vst.Controls.TableView)Body.Child;

            Header.DataContext = context;
            foreach (Vst.Controls.TableColumn c in context.TableColumns)
            {
                grid.Columns.Add(c);
            }
            _originalItems = (IEnumerable<object>)context.Model; // Store original items
            grid.ItemsSource = _originalItems;
            Total.Text = grid.RowsCount.ToString();

            if (context.Search != null)
            {
                // Handle clear search action
                Header.SearchBox.Cleared += () => grid.ItemsSource = _originalItems;

                // Attempt to use the existing Searching event for real-time search
                Header.SearchBox.Searching += (searchText) =>
                {
                    var searchTextLower = searchText?.ToLower() ?? string.Empty;
                    if (string.IsNullOrEmpty(searchTextLower))
                    {
                        grid.ItemsSource = _originalItems; // Reset to original items if search is empty
                    }
                    else
                    {
                        var filteredItems = new List<object>();
                        foreach (var item in _originalItems)
                        {
                            if (context.Search(item, searchTextLower))
                            {
                                filteredItems.Add(item);
                            }
                        }
                        grid.ItemsSource = filteredItems;
                    }
                };

                // Fallback: Check if SearchBox contains a TextBox and attach to TextChanged
                if (Header.SearchBox is FrameworkElement element)
                {
                    var textBox = FindVisualChild<TextBox>(element);
                    if (textBox != null)
                    {
                        textBox.TextChanged += (sender, e) =>
                        {
                            var searchTextLower = textBox.Text?.ToLower() ?? string.Empty;
                            if (string.IsNullOrEmpty(searchTextLower))
                            {
                                grid.ItemsSource = _originalItems;
                            }
                            else
                            {
                                var filteredItems = new List<object>();
                                foreach (var item in _originalItems)
                                {
                                    if (context.Search(item, searchTextLower))
                                    {
                                        filteredItems.Add(item);
                                    }
                                }
                                grid.ItemsSource = filteredItems;
                            }
                        };
                    }
                }
            }
        }

        public DataListViewLayout()
        {
            InitializeComponent();

            var grid = new Vst.Controls.TableView();
            Body.Child = grid;

            grid.OpenItem += e => {
                App.RedirectToAction("edit", e);
            };

            Header.CreateAction(new ActionContext("Thêm mới", () => App.RedirectToAction("add")));
        }

        // Helper method to find a TextBox in the visual tree
        private T FindVisualChild<T>(DependencyObject parent) where T : DependencyObject
        {
            for (int i = 0; i < VisualTreeHelper.GetChildrenCount(parent); i++)
            {
                var child = VisualTreeHelper.GetChild(parent, i);
                if (child is T found)
                {
                    return found;
                }
                var result = FindVisualChild<T>(child);
                if (result != null)
                {
                    return result;
                }
            }
            return null;
        }
    }
}