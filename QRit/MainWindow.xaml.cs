using Microsoft.Win32;
using QRCoder;
using System;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Windows;
using System.Windows.Media.Imaging;
using Color = System.Drawing.Color;

namespace QRit
{
    public partial class MainWindow : Window
    {
        private Bitmap currentQrCodeImage;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void BrowseLogo_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image files (*.png;*.jpg;*.jpeg)|*.png;*.jpg;*.jpeg";
            if (openFileDialog.ShowDialog() == true)
            {
                LogoPathInput.Text = openFileDialog.FileName;
            }
        }

        private void GenerateQRCode_Click(object sender, RoutedEventArgs e)
        {
            string qrText = TextInput.Text;
            string logoPath = LogoPathInput.Text;
            int logoSizePercent = (int)LogoSizeSlider.Value;
            Color qrCodeColor;
            Color backgroundColor;

            try
            {
                qrCodeColor = ParseColor(QRCodeColorInput.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Invalid QR Code color. Please enter a valid Hex or RGBA value.");
                return;
            }

            try
            {
                backgroundColor = ParseColor(BackgroundColorInput.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Invalid background color. Please enter a valid Hex or RGBA value.");
                return;
            }

            if (string.IsNullOrEmpty(qrText))
            {
                MessageBox.Show("Please enter text for the QR Code.");
                return;
            }

            // QR Code generation
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            {
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(qrText, QRCodeGenerator.ECCLevel.Q);
                using (QRCode qrCode = new QRCode(qrCodeData))
                {
                    if (string.IsNullOrEmpty(logoPath) || !File.Exists(logoPath))
                    {
                        currentQrCodeImage = qrCode.GetGraphic(20, qrCodeColor, backgroundColor, null);
                    }
                    else
                    {
                        Bitmap logo = GetIconBitmap(logoPath);
                        currentQrCodeImage = qrCode.GetGraphic(20, qrCodeColor, backgroundColor, logo, logoSizePercent, 6);
                    }

                    // Convert Bitmap to BitmapImage
                    QRCodeImage.Source = BitmapToImageSource(currentQrCodeImage);
                }
            }
        }

        private void ExportQRCode_Click(object sender, RoutedEventArgs e)
        {
            if (currentQrCodeImage == null)
            {
                MessageBox.Show("Please generate a QR code first.");
                return;
            }

            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.Filter = "PNG files (*.png)|*.png";
            saveFileDialog.FileName = "QRCode.png";

            if (saveFileDialog.ShowDialog() == true)
            {
                using (Bitmap largeQrCodeImage = new Bitmap(currentQrCodeImage, new System.Drawing.Size(4000, 4000)))
                {
                    largeQrCodeImage.Save(saveFileDialog.FileName, System.Drawing.Imaging.ImageFormat.Png);
                }
                MessageBox.Show("QR Code saved successfully.");
            }
        }

        private Color ParseColor(string colorInput)
        {
            if (colorInput.StartsWith("#"))
            {
                // Hex color
                return ColorTranslator.FromHtml(colorInput);
            }
            else if (colorInput.StartsWith("rgba"))
            {
                // RGB color
                var rgbValues = colorInput.Trim(new char[] { 'r', 'g', 'b', 'a', '(', ')' }).Split(',');
                if (rgbValues.Length != 4)
                {
                    throw new FormatException("Invalid RGBA format. Example: rgba(200,0,100,255)");
                }
                int r = int.Parse(rgbValues[0].Trim());
                int g = int.Parse(rgbValues[1].Trim());
                int b = int.Parse(rgbValues[2].Trim());
                int a = int.Parse(rgbValues[3].Trim());
                return Color.FromArgb(a, r, g, b);
            }
            else
            {
                throw new FormatException("Unknown color format.");
            }
        }

        private Bitmap GetIconBitmap(string iconPath)
        {
            try
            {
                return (Bitmap)Bitmap.FromFile(iconPath);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Failed to load logo: {ex.Message}");
                return null;
            }
        }

        private BitmapImage BitmapToImageSource(Bitmap bitmap)
        {
            using (MemoryStream memory = new MemoryStream())
            {
                bitmap.Save(memory, System.Drawing.Imaging.ImageFormat.Png);
                memory.Position = 0;
                BitmapImage bitmapImage = new BitmapImage();
                bitmapImage.BeginInit();
                bitmapImage.StreamSource = memory;
                bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                bitmapImage.EndInit();
                return bitmapImage;
            }
        }

        private void CloseBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void MainBorder_MouseDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void Label_MouseLeftButtonDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            string url = "https://discord.gg/BDzwErpAPb";
            Process.Start(new ProcessStartInfo("cmd", $"/c start {url}") { CreateNoWindow = true });
        }
    }
}
