   M S B A M L   `   `   `  ���� ?  ;QRit, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:QRitQRit      QRit.MainWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     X TFontAwesome.Sharp, Version=6.3.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fFfa=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  localclr-namespace:QRit    � Title$
  QRit�� � Icon$ /icons8-qr-96.png�� � WindowStartupLocation$ CenterScreen=� � WindowStyle$
 None=� � AllowsTransparency$
 True��
������ $	��450��$	��800�� � 
ResizeMode$ NoResize=� � 	Resources    CustomButtonStyle �� 
TargetType �� Property	 �� Value
 �� 
TargetType ��Name �� CornerRadius �� Triggers P� Property P� Value �� 
TargetName  CustomButtonStyle2��%�  &	        &	 �    �� " ��.���  � ��	 �#890000��  � ��
	 �������  � ��$
	 Bold"���  � ��	 �#890000��  � ��$	 1q���  � ��$
	 10,5q���  � ��	 �� "
 ��.R��� $ border��#��z��#��z��#��z��$ 5��._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ��� $ border�� � ��	 �#B22222��  �@�Cursor$
	 Hand��P�  � ��$
 True��. ��� $ border�� � ��	 �#8B0000�� " ��.���  � ��	 �#890000��  � ��
	 �������  � ��$
	 Bold"���  � ��	 �#890000��  � ��$	 1q���  � ��$
	 10,5q���  � ��	 �� "
 ��.R��� $ border��#��z��#��z��#��z��$ 5 10 5 5��._��� $��Center=�$��Center=� P�  �@J�IsMouseOver$
 True��. ��� $ border�� � ��	 �#B22222��  �@�Cursor$
	 Hand��P�  � ��$
 True��. ��� $ border�� � ��	 �#8B0000.���� -   $ 
MainBorder�����#111���#333$��1q�$ 10��._��  � ColumnDefinitions �� $��20 ��� $	��400 ��� $��* ��� $��20 � � RowDefinitions �� $��20 ��� $��* ��� $��20 �.+��� $��1��$��1��.+���  �� Orientation$ 
Horizontal=�$��60��$��0 0 0 10q�.+��� $��/icons8-qr-96.png��$��30��$��30���� $
��QRit�����#890000$��30(�$
��Bold"�$
��Left=�$��Center=��� $ Vertical=�$
��Left=�.+��� $��Enter Text for QR Code.��
��������� 
�������$	��390��$��25��$ 5��$��5 0 0 0q�._��� -    ��Name$ 	TextInput��$	��380��$��20��
������ $��0q�$
��Left=�$��Center=�.���� $ 
Horizontal=�$��0 10 0 0q�.+��� $ Vertical=�.+��� $��Path to logo (optional)��
��������� 
�������$	��300��$��25��$ 5��$��5 0 0 0q�._��� -   $ LogoPathInput��$	��290��$��20��
������ $��0q�$
��Left=�$��Center=��� -   $��Browse��#��[  $��80��$��25��$��10 0 0 0q�$��Bottom=��� $ 
Horizontal=�$��5 10 0 0q�.+��� $��
Logo Size:��$��Center=�$��0,0,10,0q�
��������� -    ��Name$ LogoSizeSlider��$	��330�� � Minimum$ 16Q� � Maximum$ 32Q� � Value$ 20Q��� $ 
Horizontal=�$��5 10 0 0q�.+��� $��QR Code Color (Hex/RGBA):��$��Center=�$��0,0,10,0q�
��������� 
�������$	��155��$��25��$ 5��$��80 0 0 0q�._��� -   $ QRCodeColorInput��$	��150��$��20��
������ $��0q�$
��Left=�$��Center=� � ToolTip$" Example: rgba(200,0,100,255)��$��#00008B���� $ 
Horizontal=�$��5 10 0 0q�.+��� $"��Background Color (Hex/RGBA):��$��Center=�$��0,0,10,0q�
��������� 
�������$	��155��$��25��$ 5��$��64 0 0 0q�._��� -   $ BackgroundColorInput��$	��150��$��20��
������ $��0q�$
��Left=�$��Center=�$" Example: rgba(200,0,100,255)��$��#FFFFFF���� -   $��Generate QR Code��$��0 40 0 0q�$	��150��$��30��$��1��$��1��$��Center=�$��Bottom=�#��[  �� $��2��$��1��.+��� ���#222$	��300��$	��300��$��30q�$ 10��._��� -	    ��Name$ QRCodeImage��$	��280��$	��280���� -
   $��Export as PNG��$	��150��$��30��$��10q�#��[  �� $ 
Horizontal=�$��2��$��3��$��0��$��2��$��Right=�$	��Top=�.+��� -    ��Name$ CloseBtn��
������ $��0q�#��[ .��!  FontAwesome.Sharp.IconImage  �  �FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.3.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]]   Icon$ Xmark=�   
Foreground
 �����$��15��$��15��$��10q��� -    � Cursor$
 Hand��$��2��$��2��$��3��$��Right=�$��V1.0.0 - DezzyCode��$��8(�
�������$��0 0 5 0q�