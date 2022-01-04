CREATE DATABASE PhanMemTraCuuMonCTDL_GT1
GO
USE [PhanMemTraCuuMonCTDL_GT1]
GO
/****** Object:  Table [dbo].[baihoc]    Script Date: 1/4/2022 8:39:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[baihoc](
	[baiso] [varchar](5) NOT NULL,
	[tenbai] [nvarchar](200) NULL,
	[duongdan] [nvarchar](200) NULL,
	[chuongso] [int] NULL,
	[noidung] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[baiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chuong]    Script Date: 1/4/2022 8:39:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chuong](
	[chuongso] [int] NOT NULL,
	[tenchuong] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[chuongso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loainoidung]    Script Date: 1/4/2022 8:39:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loainoidung](
	[maloai] [varchar](10) NOT NULL,
	[tenloai] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_loainoidung] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhan]    Script Date: 1/4/2022 8:39:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhan](
	[manhan] [varchar](10) NOT NULL,
	[tennhan] [nvarchar](100) NULL,
 CONSTRAINT [PK_nhan] PRIMARY KEY CLUSTERED 
(
	[manhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[noidungbai_nhan]    Script Date: 1/4/2022 8:39:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noidungbai_nhan](
	[manhan] [varchar](10) NOT NULL,
	[mand] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[noidungbaihoc]    Script Date: 1/4/2022 8:39:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noidungbaihoc](
	[mand] [varchar](10) NOT NULL,
	[tennd] [nvarchar](max) NULL,
	[batdau] [int] NOT NULL,
	[ketthuc] [int] NOT NULL,
	[maloai] [varchar](10) NOT NULL,
	[baiso] [varchar](5) NOT NULL,
 CONSTRAINT [PK_noidungbaihoc] PRIMARY KEY CLUSTERED 
(
	[mand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'1.1', N'Xác định bài toán', N'..\..\public\data\C1\1_1.docx', 1, N'1.1. XÁC ĐỊNH BÀI TOÁN
Input  Process  Output
(Dữ liệu vào  Xử lý  Kết quả ra)
Việc xác định bài toán tức là phải xác định xem ta phải giải quyết vấn đề gì?, với giả thiết nào đã cho và lời giải cần phải đạt những yêu cầu gì. Khác với bài toán thuần tuý toán học chỉ cần xác định rõ giả thiết và kết luận chứ không cần xác định yêu cầu về lời giải, đôi khi những bài toán tin học ứng dụng trong thực tế chỉ cần tìm lời giải tốt tới mức nào đó, thậm chí là tồi ở mức chấp nhận được. Bởi lời giải tốt nhất đòi hỏi quá nhiều thời gian và chi phí.
Ví dụ:
Khi cài đặt các hàm số phức tạp trên máy tính. Nếu tính bằng cách khai triển chuỗi vô hạn thì độ chính xác cao hơn nhưng thời gian chậm hơn hàng tỉ lần so với phương pháp xấp xỉ. Trên thực tế việc tính toán luôn luôn cho phép chấp nhận một sai số nào đó nên các hàm số trong máy tính đều được tính bằng phương pháp xấp xỉ của giải tích số
Xác định đúng yêu cầu bài toán là rất quan trọng bởi nó ảnh hưởng tới cách thức giải quyết và chất lượng của lời giải. Một bài toán thực tế thường cho bởi những thông tin khá mơ hồ và hình thức, ta phải phát biểu lại một cách chính xác và chặt chẽ để hiểu đúng bài toán.
Ví dụ:
Bài toán: Một dự án có n người tham gia thảo luận, họ muốn chia thành các nhóm và mỗi nhóm thảo luận riêng về một phần của dự án. Nhóm có bao nhiêu người thì được trình lên bấy nhiêu ý kiến. Nếu lấy ở mỗi nhóm một ý kiến đem ghép lại thì được một bộ ý kiến triển khai dự án. Hãy tìm cách chia để số bộ ý kiến cuối cùng thu được là lớn nhất.
Phát biểu lại: Cho một số nguyên dương n, tìm các phân tích n thành tổng các số nguyên dương sao cho tích của các số đó là lớn nhất.
Trên thực tế, ta nên xét một vài trường hợp cụ thể để thông qua đó hiểu được bài toán rõ hơn và thấy được các thao tác cần phải tiến hành. Đối với những bài toán đơn giản, đôi khi chỉ cần qua ví dụ là ta đã có thể đưa về một bài toán quen thuộc để giải.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'1.2', N'Tìm cấu trúc dữ liệu biểu diễn bài toán', N'..\..\public\data\C1\1_2.docx', 1, N'1.2. TÌM CẤU TRÚC DỮ LIỆU BIỂU DIỄN BÀI TOÁN
Khi giải một bài toán, ta cần phải định nghĩa tập hợp dữ liệu để biểu diễn tình trạng cụ thể. Việc lựa chọn này tuỳ thuộc vào vấn đề cần giải quyết và những thao tác sẽ tiến hành trên dữ liệu vào. Có những thuật toán chỉ thích ứng với một cách tổ chức dữ liệu nhất định, đối với những cách tổ chức dữ liệu khác thì sẽ kém hiệu quả hoặc không thể thực hiện được. Chính vì vậy nên bước xây dựng cấu trúc dữ liệu không thể tách rời bước tìm kiếm thuật toán giải quyết vấn đề.
Các tiêu chuẩn khi lựa chọn cấu trúc dữ liệu
Cấu trúc dữ liệu trước hết phải biểu diễn được đầy đủ các thông tin nhập và xuất của bài toán Cấu trúc dữ liệu phải phù hợp với các thao tác của thuật toán mà ta lựa chọn để giải quyết bài toán.
Cấu trúc dữ liệu phải cài đặt được trên máy tính với ngôn ngữ lập trình đang sử dụng
Đối với một số bài toán, trước khi tổ chức dữ liệu ta phải viết một đoạn chương trình nhỏ để khảo sát xem dữ liệu cần lưu trữ lớn tới mức độ nào.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'1.3', N'Tìm thuật toán', N'..\..\public\data\C1\1_3.docx', 1, N'1.3. TÌM THUẬT TOÁN
Thuật toán là một hệ thống chặt chẽ và rõ ràng các quy tắc nhằm xác định một dãy thao tác trên cấu trúc dữ liệu sao cho: Với một bộ dữ liệu vào, sau một số hữu hạn bước thực hiện các thao tác đã chỉ ra, ta đạt được mục tiêu đã định.
Các đặc trưng của thuật toán:
1.3.1. Tính đơn định
Ở mỗi bước của thuật toán, các thao tác phải hết sức rõ ràng, không gây nên sự nhập nhằng, lộn xộn, tuỳ tiện, đa nghĩa. Thực hiện đúng các bước của thuật toán thì với một dữ liệu vào, chỉ cho duy nhất một kết quả ra.
1.3.2. Tính dừng
Thuật toán không được rơi vào quá trình vô hạn, phải dừng lại và cho kết quả sau một số hữu hạn bước.
1.3.3. Tính đúng
Sau khi thực hiện tất cả các bước của thuật toán theo đúng quá trình đã định, ta phải được kết quả mong muốn với mọi bộ dữ liệu đầu vào. Kết quả đó được kiểm chứng bằng yêu cầu bài toán.
1.3.4 Tính phổ dụng
Thuật toán phải dễ sửa đổi để thích ứng được với bất kỳ bài toán nào trong một lớp các bài toán và có thể làm việc trên các dữ liệu khác nhau.
1.3.5. Tính khả thi
a) Kích thước phải đủ nhỏ: Ví dụ: Một thuật toán sẽ có tính hiệu quả bằng 0 nếu lượng bộ nhớ mà nó yêu cầu vượt quá khả năng lưu trữ của hệ thống máy tính.
b) Thuật toán phải được máy tính thực hiện trong thời gian cho phép, điều này khác với lời giải toán (Chỉ cần chứng minh là kết thúc sau hữu hạn bước). Ví dụ như xếp thời khoá biểu cho một học kỳ thì không thể cho máy tính chạy tới học kỳ sau mới ra được.
c) Phải dễ hiểu và dễ cài đặt.
Ví dụ:
Input: 2 số nguyên tự nhiên a và b không đồng thời bằng 0 Output: Ước số chung lớn nhất của a và b
Thuật toán sẽ tiến hành được mô tả như sau: (Thuật toán Euclide)
Bước 1 (Input): Nhập a và b: Số tự nhiên
Bước 2: Nếu b  0 thì chuyển sang bước 3, nếu không thì bỏ qua bước 3, đi làm bước 4 Bước 3: Đặt r := a mod b; Đặt a := b; Đặt b := r; Quay trở lại bước 2.
Bước 4 (Output): Kết luận ước số chung lớn nhất phải tìm là giá trị của a. Kết thúc thuật toán.
 

Lưu đồ thuật giải (Flowchart)

Khi mô tả thuật toán bằng ngôn ngữ tự nhiên, ta không cần phải quá chi tiết các bước và tiến trình thực hiện mà chỉ cần mô tả một cách hình thức đủ để chuyển thành ngôn ngữ lập trình. Viết sơ đồ các thuật toán đệ quy là một ví dụ.
Đối với những thuật toán phức tạp và nặng về tính toán, các bước và các công thức nên mô tả một cách tường minh và chú thích rõ ràng để khi lập trình ta có thể nhanh chóng tra cứu.
Đối với những thuật toán kinh điển thì phải thuộc. Khi giải một bài toán lớn trong một thời gian giới hạn, ta chỉ phải thiết kế tổng thể còn những chỗ đã thuộc thì cứ việc lắp ráp vào. Tính đúng đắn của những mô-đun đã thuộc ta không cần phải quan tâm nữa mà tập trung giải quyết các phần khác.
 

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'1.4', N'Lập trình', N'..\..\public\data\C1\1_4.docx', 1, N'1.4. LẬP TRÌNH
Sau khi đã có thuật toán, ta phải tiến hành lập trình thể hiện thuật toán đó. Muốn lập trình đạt hiệu quả cao, cần phải có kỹ thuật lập trình tốt. Kỹ thuật lập trình tốt thể hiện ở kỹ năng viết chương trình, khả năng gỡ rối và thao tác nhanh. Lập trình tốt không phải chỉ cần nắm vững ngôn ngữ lập trình là đủ, phải biết cách viết chương trình uyển chuyển, khôn khéo và phát triển dần dần để chuyển các ý tưởng ra thành chương trình hoàn chỉnh. Kinh nghiệm cho thấy một thuật toán hay nhưng do cài đặt vụng về nên khi chạy lại cho kết quả sai hoặc tốc độ chậm.
Thông thường, ta không nên cụ thể hoá ngay toàn bộ chương trình mà nên tiến hành theo phương pháp tinh chế từng bước (Stepwise refinement):
Ban đầu, chương trình được thể hiện bằng ngôn ngữ tự nhiên, thể hiện thuật toán với các bước tổng thể, mỗi bước nêu lên một công việc phải thực hiện.
Một công việc đơn giản hoặc là một đoạn chương trình đã được học thuộc thì ta tiến hành viết mã lệnh ngay bằng ngôn ngữ lập trình.
Một công việc phức tạp thì ta lại chia ra thành những công việc nhỏ hơn để lại tiếp tục với những công việc nhỏ hơn đó.
Trong quá trình tinh chế từng bước, ta phải đưa ra những biểu diễn dữ liệu. Như vậy cùng với sự tinh chế các công việc, dữ liệu cũng được tinh chế dần, có cấu trúc hơn, thể hiện rõ hơn mối liên hệ giữa các dữ liệu.
Phương pháp tinh chế từng bước là một thể hiện của tư duy giải quyết vấn đề từ trên xuống, giúp cho người lập trình có được một định hướng thể hiện trong phong cách viết chương trình. Tránh việc mò mẫm, xoá đi viết lại nhiều lần, biến chương trình thành tờ giấy nháp.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'1.5', N'Kiểm thử', N'..\..\public\data\C1\1_5.docx', 1, N'1.5.  KIỂM THỬ
1.5.1. Chạy thử và tìm lỗi
Chương trình là do con người viết ra, mà đã là con người thì ai cũng có thể nhầm lẫn. Một chương trình viết xong chưa chắc đã chạy được ngay trên máy tính để cho ra kết quả mong muốn. Kỹ năng tìm lỗi, sửa lỗi, điều chỉnh lại chương trình cũng là một kỹ năng quan trọng của người lập trình. Kỹ năng này chỉ có được bằng kinh nghiệm tìm và sửa chữa lỗi của chính mình.
Có ba loại lỗi:
Lỗi cú pháp: Lỗi này hay gặp nhất nhưng lại dễ sửa nhất, chỉ cần nắm vững ngôn ngữ lập trình là đủ. Một người được coi là không biết lập trình nếu không biết sửa lỗi cú pháp.
Lỗi cài đặt: Việc cài đặt thể hiện không đúng thuật toán đã định, đối với lỗi này thì phải xem lại tổng thể chương trình, kết hợp với các chức năng gỡ rối để sửa lại cho đúng.Lỗi thuật toán: Lỗi này ít gặp nhất nhưng nguy hiểm nhất, nếu nhẹ thì phải điều chỉnh lại  thuật toán, nếu nặng thì có khi phải loại bỏ hoàn toàn thuật toán sai và làm lại từ đầu.
1.5.2.  Xây dựng các bộ test
Có nhiều chương trình rất khó kiểm tra tính đúng đắn. Nhất là khi ta không biết kết quả đúng là thế nào?. Vì vậy nếu như chương trình vẫn chạy ra kết quả (không biết đúng sai thế nào) thì việc tìm lỗi rất khó khăn. Khi đó ta nên làm các bộ test để thử chương trình của mình.
Các bộ test nên đặt trong các file văn bản, bởi việc tạo một file văn bản rất nhanh và mỗi lần chạy thử chỉ cần thay tên file dữ liệu vào là xong, không cần gõ lại bộ test từ bàn phím. Kinh nghiệm làm các bộ test là:
Bắt đầu với một bộ test nhỏ, đơn giản, làm bằng tay cũng có được đáp số để so sánh với kết quả chương trình chạy ra.
Tiếp theo vẫn là các bộ test nhỏ, nhưng chứa các giá trị đặc biệt hoặc tầm thường. Kinh nghiệm cho thấy đây là những test dễ sai nhất.
Các bộ test phải đa dạng, tránh sự lặp đi lặp lại các bộ test tương tự.
Có một vài test lớn chỉ để kiểm tra tính chịu đựng của chương trình mà thôi. Kết quả có đúng hay không thì trong đa số trường hợp, ta không thể kiểm chứng được với test này.
Lưu ý rằng chương trình chạy qua được hết các test không có nghĩa là chương trình đó đã đúng. Bởi có thể ta chưa xây dựng được bộ test làm cho chương trình chạy sai. Vì vậy nếu có thể, ta nên tìm cách chứng minh tính đúng đắn của thuật toán và chương trình, điều này thường rất khó.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'1.6', N'Tối ưu chương trình', N'..\..\public\data\C1\1_6.docx', 1, N'1.6. TỐI ƯU CHƯƠNG TRÌNH
Một chương trình đã chạy đúng không có nghĩa là việc lập trình đã xong, ta phải sửa đổi lại một vài chi tiết để chương trình có thể chạy nhanh hơn, hiệu quả hơn. Thông thường, trước khi kiểm thử thì ta nên đặt mục tiêu viết chương trình sao cho đơn giản, miễn sao chạy ra kết quả đúng là được, sau đó khi tối ưu chương trình, ta xem lại những chỗ nào viết chưa tốt thì tối ưu lại mã lệnh để chương trình ngắn hơn, chạy nhanh hơn. Không nên viết tới đâu tối ưu mã đến đó, bởi chương trình có mã lệnh tối ưu thường phức tạp và khó kiểm soát.
Việc tối ưu chương trình nên dựa trên các tiêu chuẩn sau:
1.6.1. Tính tin cậy
Chương trình phải chạy đúng như dự định, mô tả đúng một giải thuật đúng. Thông thường khi viết chương trình, ta luôn có thói quen kiểm tra tính đúng đắn của các bước mỗi khi có thể.
1.6.2. Tính uyển chuyển
Chương trình phải dễ sửa đổi. Bởi ít có chương trình nào viết ra đã hoàn hảo ngay được mà vẫn cần phải sửa đổi lại. Chương trình viết dễ sửa đổi sẽ làm giảm bớt công sức của lập trình viên khi phát triển chương trình.
1.6.3. Tính trong sáng
Chương trình viết ra phải dễ đọc dễ hiểu, để sau một thời gian dài, khi đọc lại còn hiểu mình làm cái gì?. Để nếu có điều kiện thì còn có thể sửa sai (nếu phát hiện lỗi mới), cải tiến hay biến đổi để được chương trình giải quyết bài toán khác. Tính trong sáng của chương trình phụ thuộc rất nhiều vào công cụ lập trình và phong cách lập trình.
1.6.4. Tính hữu hiệu
Chương trình phải chạy nhanh và ít tốn bộ nhớ, tức là tiết kiệm được cả về không gian và thời gian. Để có một chương trình hữu hiệu, cần phải có giải thuật tốt và những tiểu xảo khi lập trình. Tuy nhiên, việc áp dụng quá nhiều tiểu xảo có thể khiến chương trình trở nên rối rắm, khó hiểu khi sửa đổi. Tiêu chuẩn hữu hiệu nên dừng lại ở mức chấp nhận được, không quan trọng bằng ba tiêu chuẩn trên. Bởi phần cứng phát triển rất nhanh, yêu cầu hữu hiệu không cần phải đặt ra quá nặng.
Từ những phân tích ở trên, chúng ta nhận thấy rằng việc làm ra một chương trình đòi hỏi rất nhiều công đoạn và tiêu tốn khá nhiều công sức. Chỉ một công đoạn không hợp lý sẽ làm tăng chi phí viết chương trình. Nghĩ ra cách giải quyết vấn đề đã khó, biến ý tưởng đó thành hiện thực cũng không dễ chút nào.
Những cấu trúc dữ liệu và giải thuật đề cập tới trong chuyên đề này là những kiến thức rất phổ thông, một người học lập trình không sớm thì muộn cũng phải biết tới. Chỉ hy vọng rằng khi học xong chuyên đề này, qua những cấu trúc dữ liệu và giải thuật hết sức mẫu mực, chúng ta rút ra được bài học kinh nghiệm: Đừng bao giờ viết chương trình khi mà chưa suy xét kỹ về giải thuật và những dữ liệu cần thao tác, bởi như vậy ta dễ mắc phải hai sai lầm trầm trọng: hoặc là sai về giải thuật, hoặc là giải thuật không thể triển khai nổi trên một cấu trúc dữ liệu không phù hợp. Chỉ cần mắc một trong hai lỗi đó thôi thì nguy cơ sụp đổ toàn bộ chương trình là hoàn toàn có thể, càng cố chữa càng bị rối, khả năng hầu như chắc chắn là phải làm lại từ đầu.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'2.1', N'Độ phức tạp tính toán của giải thuật', N'..\..\public\data\C2\2_1.docx', 2, N'2.1. ĐỘ PHỨC TẠP TÍNH TOÁN CỦA GIẢI THUẬT
Với một bài toán không chỉ có một giải thuật. Chọn một giải thuật đưa tới kết quả nhanh nhất là một đòi hỏi thực tế. Như vậy cần có một căn cứ nào đó để nói rằng giải thuật này nhanh hơn giải thuật kia ?.
Thời gian thực hiện một giải thuật bằng chương trình máy tính phụ thuộc vào rất nhiều yếu tố. Một yếu tố cần chú ý nhất đó là kích thước của dữ liệu đưa vào. Dữ liệu càng lớn thì thời gian xử lý càng chậm, chẳng hạn như thời gian sắp xếp một dãy số phải chịu ảnh hưởng của số lượng các số thuộc dãy số đó. Nếu gọi n là kích thước dữ liệu đưa vào thì thời gian thực hiện của một giải thuật có thể biểu diễn một cách tương đối như một hàm của n: T(n).
Phần cứng máy tính, ngôn ngữ viết chương trình và chương trình dịch ngôn ngữ ấy đều ảnh hưởng tới thời gian thực hiện. Những yếu tố này không giống nhau trên các loại máy, vì vậy không thể dựa vào chúng khi xác định T(n). Tức là T(n) không thể biểu diễn bằng đơn vị thời gian giờ, phút, giây được. Tuy nhiên, không phải vì thế mà không thể so sánh được các giải thuật về mặt tốc độ. Nếu như thời gian thực hiện một giải thuật là T1(n) = n2 và thời gian thực hiện của một giải thuật khác là T2(n) = 100n thì khi n đủ lớn, thời gian thực hiện của giải thuật T2 rõ ràng nhanh hơn giải thuật T1. Khi đó, nếu nói rằng thời gian thực hiện giải thuật tỉ lệ thuận với n hay tỉ lệ thuận với n2 cũng cho ta một cách đánh giá tương đối về tốc độ thực hiện của giải thuật đó khi n khá lớn. Cách đánh giá thời gian thực hiện giải thuật độc lập với máy tính và các yếu tố liên quan tới máy tính như vậy sẽ dẫn tới khái niệm gọi là độ phức tạp tính toán của giải thuật.
Cho f và g là hai hàm xác định dương với mọi n. Hàm f(n) được gọi là O(g(n)) nếu tồn tại một hằng số c > 0 và một giá trị n0 sao cho:
f(n)  c.g(n) với  n  n0
Nghĩa là nếu xét những giá trị n  n0 thì hàm f(n) sẽ bị chặn trên bởi một hằng số nhân với g(n). Khi đó, nếu f(n) là thời gian thực hiện của một giải thuật thì ta nói giải thuật đó có cấp là g(n), ký hiệu: O(g(n))(*) hay Θ(g(n)).

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'2.2', N'Xác định độ phức tạp tính toán của giải thuật', N'..\..\public\data\C2\2_2.docx', 2, N'2.2. XÁC ĐỊNH ĐỘ PHỨC TẠP TÍNH TOÁN CỦA GIẢI THUẬT
Việc xác định độ phức tạp tính toán của một giải thuật bất kỳ có thể rất phức tạp. Tuy nhiên, trong thực tế, đối với một số giải thuật ta có thể phân tích bằng một số quy tắc đơn giản:
2.2.1. Quy tắc cộng
Nếu đoạn chương trình P1 có thời gian thực hiện T1(n) =O(f(n)) và đoạn chương trình P2 có thời gian thực hiện là T2(n) = O(g(n)) thì thời gian thực hiện P1 rồi đến P2 tiếp theo sẽ là
T1(n) + T2(n) = O(max(f(n), g(n)))
Chứng minh:
T1(n) = O(f(n)) nên  n1 và c1để T1(n)  c1.f(n) với  n  n1. T2(n) = O(g(n)) nên  n2 và c2 để T2(n)  c2.g(n) với  n  n2. Chọn n0 = max(n1, n2) và c = max(c1, c2) ta có:
Với  n  n0:
T1(n) + T2(n)  c1.f(n) + c2.g(n)  c.f(n) + c.g(n)  c.(f(n) + g(n))  2c.(max(f(n), g(n))). Vậy T1(n) + T2(n) = O(max(f(n), g(n))).
2.2.2. Quy tắc nhân
Nếu đoạn chương trình P có thời gian thực hiện là T(n) = O(f(n)). Khi đó, nếu thực hiện k(n) lần đoạn chương trình P với k(n) = O(g(n)) thì độ phức tạp tính toán sẽ là O(g(n).f(n))
Chứng minh:
Thời gian thực hiện k(n) lần đoạn chương trình P sẽ là k(n)T(n). Theo định nghĩa:
 ck  0 và nk để k(n)  ck(g(n)) với  n  nk
 cT  0 và nT để T(n)  cT(f(n)) với  n  nT
Vậy với  n  max(nT, nk) ta có k(n).T(n)  cT.ck(g(n).f(n))
2.2.3. Một số tính chất
Theo định nghĩa về độ phức tạp tính toán ta có một số tính chất:
a) Với P(n) là một đa thức bậc k thì O(P(n)) = O(nk). Vì thế, một thuật toán có độ phức tạp cấp đa thức, người ta thường ký hiệu là O(nk)
b) Với a và b là hai cơ số tuỳ ý và f(n) là một hàm dương thì logaf(n) = logab.logbf(n). Tức là: O(logaf(n)) = O(logbf(n)). Vậy với một thuật toán có độ phức tạp cấp logarit của f(n), người ta ký hiệu là O(logf(n)) mà không cần ghi cơ số của logarit.
c) Nếu một thuật toán có độ phức tạp là hằng số, tức là thời gian thực hiện không phụ thuộc vào kích thước dữ liệu vào thì ta ký hiệu độ phức tạp tính toán của thuật toán đó là O(1).
d) Một giải thuật có cấp là các hàm như 2n, n!, nn được gọi là một giải thuật có độ phức tạp hàm mũ. Những giải thuật như vậy trên thực tế thường có tốc độ rất chậm. Các giải thuật có cấp là các hàm đa thức hoặc nhỏ hơn hàm đa thức thì thường chấp nhận được.
e) Không phải lúc nào một giải thuật cấp O(n2) cũng tốt hơn giải thuật cấp O(n3). Bởi nếu như giải thuật cấp O(n2) có thời gian thực hiện là 1000n2, còn giải thuật cấp O(n3) lại chỉ cần thời
gian thực hiện là n3, thì với n < 1000, rõ ràng giải thuật O(n3) tốt hơn giải thuật O(n2). Trên đây là xét trên phương diện tính toán lý thuyết để định nghĩa giải thuật này "tốt" hơn giải thuật kia, khi chọn một thuật toán để giải một bài toán thực tế phải có một sự mềm dẻo nhất định.
f) Cũng theo định nghĩa về độ phức tạp tính toán
Một thuật toán có cấp O(1) cũng có thể viết là O(logn) Một thuật toán có cấp O(logn) cũng có thể viết là O(n) Một thuật toán có cấp O(n) cũng có thể viết là O(n.logn) Một thuật toán có cấp O(n.logn) cũng có thể viết là O(n2) Một thuật toán có cấp O(n2) cũng có thể viết là O(n3) Một thuật toán có cấp O(n3) cũng có thể viết là O(2n)
Vậy độ phức tạp tính toán của một thuật toán có nhiều cách ký hiệu, thông thường người ta chọn cấp thấp nhất có thể, tức là chọn ký pháp O(f(n)) với f(n) là một hàm tăng chậm nhất theo n.
Dưới đây là một số hàm số hay dùng để ký hiệu độ phức tạp tính toán và bảng giá trị của chúng để tiện theo dõi sự tăng của hàm theo đối số n.
 
Ví dụ:
Thuật toán tính tổng các số từ 1 tới n:
Nếu viết theo sơ đồ như sau: 
Input n;
S := 0;
for  i := 1 to n do S := S + i;
Output S;
Các đoạn chương trình ở các dòng 1, 2 và 4 có độ phức tạp tính toán là O(1).
Vòng lặp ở dòng 3 lặp n lần phép gán S := S + i, nên thời gian tính toán tỉ lệ thuận với n. Tức là độ phức tạp tính toán là O(n).
Vậy độ phức tạp tính toán của thuật toán trên là O(n). Còn nếu viết theo sơ đồ như sau:
Input n;
S := n * (n - 1) div 2; Output S;
Thì độ phức tạp tính toán của thuật toán trên là O(1), thời gian tính toán không phụ thuộc vào n.
2.2.4. Phép toán tích cực
Dựa vào những nhận xét đã nêu ở trên về các quy tắc khi đánh giá thời gian thực hiện giải thuật, ta chỉ cần chú ý đến một phép toán mà ta gọi là phép toán tích cực trong một đoạn chương trình. Đó là một phép toán trong một đoạn chương trình mà số lần thực hiện không ít hơn các phép toán khác.
Xét hai đoạn chương trình tính ex bằng công thức gần đúng:
 
Chương trình 1: Tính riêng từng hạng tử rồi cộng lại
program Exp1;
var
i, j, n: Integer; x, p, S: Real; 
begin
Write(''x, n = ''); ReadLn(x, n); S := 0;
for i := 0 to n do 
begin
p := 1;
for j := 1 to i do p := p * x / j; 
S := S + p;
end;
WriteLn(''exp('', x:1:4, '') = '', S:1:4);
end.
Ta có thể coi phép toán tích cực ở đây là phép p := p * x/i
Số lần thực hiện phép toán này là n.
Vậy độ phức tạp tính toán của thuật toán là O(n).
Chương trình 2: Tính hạng tử sau qua hạng tử trước
program Exp2;
var
i, n: Integer;
x, p, S: Real;
begin
Write(''x, n = ''); ReadLn(x, n);
S := 1; 
p := 1;
for i := 1 to n do 
begin
p := p * x / i;
S := S + p;
end;
WriteLn(''exp('', x:1:4, '') = '', S:1:4);
end.
Ta có thể coi phép toán tích cực ở đây là: p := p * x/j
Số lần thực hiện phép toán này là: 0 + 1 + 2 + … + n = n(n-1)/2 lần.
Vậy độ phức tạp tính toán của thuật toán là O(n2) 

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'2.3', N'Độ phức tạp tính toán với tình trạng dữ liệu đầu vào', N'..\..\public\data\C2\2_3.docx', 2, N'2.3. ĐỘ PHỨC TẠP TÍNH TOÁN VỚI TÌNH TRẠNG DỮ LIỆU VÀO
Có nhiều trường hợp, thời gian thực hiện giải thuật không phải chỉ phụ thuộc vào kích thước dữ liệu mà còn phụ thuộc vào tình trạng của dữ liệu đó nữa. Chẳng hạn thời gian sắp xếp một dãy số theo thứ tự tăng dần mà dãy đưa vào chưa có thứ tự sẽ khác với thời gian sắp xếp một dãy số đã sắp xếp rồi hoặc đã sắp xếp theo thứ tự ngược lại. Lúc này, khi phân tích thời gian thực hiện giải thuật ta sẽ phải xét tới trường hợp tốt nhất, trường hợp trung bình và trường  hợp xấu nhất. Khi khó khăn trong việc xác định độ phức tạp tính toán trong trường hợp trung bình (bởi việc xác định T(n) trung bình thường phải dùng tới những công cụ toán phức tạp), người ta thường chỉ đánh giá độ phức tạp tính toán trong trường hợp xấu nhất.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'2.4', N'Chi phí thực hiện thuật toán', N'..\..\public\data\C2\2_4.docx', 2, N'2.4. CHI PHÍ THỰC HIỆN THUẬT TOÁN
Khái niệm độ phức tạp tính toán đặt ra là để đánh giá chi phí thực hiện một giải thuật về mặt thời gian. Nhưng chi phí thực hiện giải thuật còn có rất nhiều yếu tố khác nữa: không gian bộ nhớ phải sử dụng là một ví dụ. Tuy nhiên, trên phương diện phân tích lý thuyết, ta chỉ có thể xét tới vấn đề thời gian bởi việc xác định các chi phí khác nhiều khi rất mơ hồ và phức tạp. Đối với người lập trình thì khác, một thuật toán với độ phức tạp dù rất thấp cũng sẽ là vô dụng nếu như không thể cài đặt được trên máy tính, chính vì vậy khi bắt tay cài đặt một thuật toán, ta phải biết cách tổ chức dữ liệu một cách khoa học, tránh lãng phí bộ nhớ không cần thiết. Có một quy luật tương đối khi tổ chức dữ liệu: Tiết kiệm được bộ nhớ thì thời gian thực hiện thường sẽ chậm hơn và ngược lại. Biết cân đối, dung hoà hai yếu tố đó là một kỹ năng cần thiết của người lập trình.

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'3.1', N'Khái niệm về đệ quy', N'..\..\public\data\C3\3_1.docx', 3, N'3.1. KHÁI NIỆM VỀ ĐỆ QUY
Ta nói một đối tượng là đệ quy nếu nó được định nghĩa qua chính nó hoặc một đối tượng khác cùng dạng với chính nó bằng quy nạp.
Ví dụ: Đặt hai chiếc gương cầu đối diện nhau. Trong chiếc gương thứ nhất chứa hình chiếc gương thứ hai. Chiếc gương thứ hai lại chứa hình chiếc gương thứ nhất nên tất nhiên nó chứa lại hình ảnh của chính nó trong chiếc gương thứ nhất… Ở một góc nhìn hợp lý, ta có thể thấy một dãy ảnh vô hạn của cả hai chiếc gương.
Một ví dụ khác là nếu người ta phát hình trực tiếp phát thanh viên ngồi bên máy vô tuyến truyền hình, trên màn hình của máy này lại có chính hình ảnh của phát thanh viên đó ngồi bên máy vô tuyến truyền hình và cứ như thế…
Trong toán học, ta cũng hay gặp các định nghĩa đệ quy:
Giai thừa của n (n!): Nếu n = 0 thì n! = 1; nếu n > 0 thì n! = n.(n-1)!
Ký hiệu số phần tử của một tập hợp hữu hạn S là |S|: Nếu S =  thì |S| = 0; Nếu S   thì tất có một phần tử x  S, khi đó |S| = |S\{x}| + 1. Đây là phương pháp định nghĩa tập các số tự nhiên.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'3.2', N'Giải thuật đệ quy', N'..\..\public\data\C3\3_2.docx', 3, N'3.2. GIẢI THUẬT ĐỆ QUY
Nếu lời giải của một bài toán P được thực hiện bằng lời giải của bài toán P'' có dạng giống như P thì đó là một lời giải đệ quy. Giải thuật tương ứng với lời giải như vậy gọi là giải thuật đệ quy. Mới nghe thì có vẻ hơi lạ nhưng điểm mấu chốt cần lưu ý là: P'' tuy có dạng giống như P, nhưng theo một nghĩa nào đó, nó phải "nhỏ" hơn P, dễ giải hơn P và việc giải nó không cần dùng đến P.
Trong Pascal, ta đã thấy nhiều ví dụ của các hàm và thủ tục có chứa lời gọi đệ quy tới chính nó, bây giờ, ta tóm tắt lại các phép đệ quy trực tiếp và tương hỗ được viết như thế nào:
Định nghĩa một hàm đệ quy hay thủ tục đệ quy gồm hai phần:
Phần neo (anchor): Phần này được thực hiện khi mà công việc quá đơn giản, có thể giải trực tiếp chứ không cần phải nhờ đến một bài toán con nào cả.
Phần đệ quy: Trong trường hợp bài toán chưa thể giải được bằng phần neo, ta xác định những bài toán con và gọi đệ quy giải những bài toán con đó. Khi đã có lời giải (đáp số) của những bài toán con rồi thì phối hợp chúng lại để giải bài toán đang quan tâm.
Phần đệ quy thể hiện tính "quy nạp" của lời giải. Phần neo cũng rất quan trọng bởi nó quyết định tới tính hữu hạn dừng của lời giải.

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'3.3', N'Ví dụ về giải thuật đệ quy', N'..\..\public\data\C3\3_3.docx', 3, N'3.3. VÍ DỤ VỀ GIẢI THUẬT ĐỆ QUY
3.3.1. Hàm tính giai thừa
function Factorial(n: Integer): Integer; 
begin
if n = 0 then Factorial := 1 
else Factorial := n * Factorial(n - 1);
end;
Ở đây, phần neo định nghĩa kết quả hàm tại n = 0, còn phần đệ quy (ứng với n > 0) sẽ định nghĩa kết quả hàm qua giá trị của n và giai thừa của n - 1.
Ví dụ: Dùng hàm này để tính 3!, trước hết nó phải đi tính 2! bởi 3! được tính bằng tích của 3 * 2!. Tương tự để tính 2!, nó lại đi tính 1! bởi 2! được tính bằng 2 * 1!. Áp dụng bước quy nạp này thêm một lần nữa, 1! = 1 * 0!, và ta đạt tới trường hợp của phần neo, đến đây từ giá trị 1 của 0!, nó tính được 1! = 1*1 = 1; từ giá trị của 1! nó tính được 2!; từ giá trị của 2! nó tính được 3!; cuối cùng cho kết quả là 6:
3! = 3 * 2!
	
2! = 2 * 1!
		
1! = 1 * 0!
			
0! = 1
3.3.2. Dãy số Fibonacci
Dãy số Fibonacci bắt nguồn từ bài toán cổ về việc sinh sản của các cặp thỏ. Bài toán đặt ra như sau:
1) Các con thỏ không bao giờ chết
2) Hai tháng sau khi ra đời, mỗi cặp thỏ mới sẽ sinh ra một cặp thỏ con (một đực, một cái)
3) Khi đã sinh con rồi thì cứ mỗi tháng tiếp theo chúng lại sinh được một cặp con mới Giả sử từ đầu tháng 1 có một cặp mới ra đời thì đến giữa tháng thứ n sẽ có bao nhiêu cặp. Ví dụ, n = 5, ta thấy:
Giữa tháng thứ 1:1 cặp (ab) (cặp ban đầu)
Giữa tháng thứ 2:1 cặp (ab) (cặp ban đầu vẫn chưa đẻ)
Giữa tháng thứ 3:2 cặp (AB)(cd) (cặp ban đầu đẻ ra thêm 1 cặp con) Giữa tháng thứ 4:3 cặp (AB)(cd)(ef) (cặp ban đầu tiếp tục đẻ)
Giữa tháng thứ 5:5 cặp (AB)(CD)(ef)(gh)(ik) (cả cặp (AB) và (CD) cùng đẻ) Bây giờ, ta xét tới việc tính số cặp thỏ ở tháng thứ n: F(n)
Nếu mỗi cặp thỏ ở tháng thứ n - 1 đều sinh ra một cặp thỏ con thì số cặp thỏ ở tháng thứ n sẽ là:
F(n) = 2 * F(n - 1)
Nhưng vấn đề không phải như vậy, trong các cặp thỏ ở tháng thứ n - 1, chỉ có những cặp thỏ đã có ở tháng thứ n - 2 mới sinh con ở tháng thứ n được thôi. Do đó F(n) = F(n - 1) + F(n - 2) (= số cũ + số sinh ra). Vậy có thể tính được F(n) theo công thức sau:
F(n) = 1 nếu n  2
F(n) = F(n - 1) + F(n - 2) nếu n > 2
function F(n: Integer): Integer; 
begin
if n  2 then F := 1 
else F := F(n - 1) + F(n - 2); 
end;
3.3.3. Giả thuyết của Collatz
Collatz đưa ra giả thuyết rằng: với một số nguyên dương X, nếu X chẵn thì ta gán X := X div 2; nếu X lẻ thì ta gán X := X * 3 + 1. Thì sau một số hữu hạn bước, ta sẽ có X = 1.
Ví dụ: X = 10, các bước tiến hành như sau:
1. X = 10 (chẵn)		X := 10 div 2;	(5)
2. X = 5   (lẻ)			X := 5 * 3 + 1;	(16)
3. X = 16 (chẵn)		X := 16 div 2;	(8)
4. X = 8   (chẵn)		X := 8 div 2		(4)
5. X = 4   (chẵn)		X := 4 div 2		(2)
6. X = 2   (chẵn)		X := 2 div 2		(1)
Cứ cho giả thuyết Collatz là đúng đắn, vấn đề đặt ra là: Cho trước số 1 cùng với hai phép toán * 2 và div 3, hãy sử dụng một cách hợp lý hai phép toán đó để biến số 1 thành một giá trị nguyên dương X cho trước.
Ví dụ: X = 10 ta có 1 * 2 * 2 * 2 * 2 div 3 * 2 = 10.
Dễ thấy rằng lời giải của bài toán gần như thứ tự ngược của phép biến đổi Collatz: Để biểu diễn số X > 1 bằng một biểu thức bắt đầu bằng số 1 và hai phép toán "* 2", "div 3". Ta chia hai trường hợp:
Nếu X chẵn, thì ta tìm cách biểu diễn số X div 2 và viết thêm phép toán * 2 vào cuối Nếu X lẻ, thì ta tìm cách biểu diễn số X * 3 + 1 và viết thêm phép toán div 3 vào cuối
procedure Solve(X: Integer); {In ra cách biểu diễn số X} 
begin
if X = 1 then Write(X) 
else 
if X mod 2 = 0 then 
begin
Solve(X div 2); 
Write('' * 2''); 
end
else 
begin
Solve(X * 3 + 1); 
Write('' div 3''); 
end;
end; 
Trên đây là cách viết đệ quy trực tiếp, còn có một cách viết đệ quy tương hỗ như sau:
procedure Solve(X: Integer); forward;

procedure SolveOdd(X: Integer); 
begin
Solve(X * 3 + 1);
Write('' div 3''); 
end;

procedure SolveEven(X: Integer); 
begin
Solve(X div 2);
Write('' * 2''); 
end;

procedure Solve(X: Integer); 
begin
if X = 1 then Write(X) 
else
if X mod 2 = 1 then SolveOdd(X) 
else SolveEven(X);
end;
Trong cả hai cách viết, để tìm biểu diễn số X theo yêu cầu chỉ cần gọi Solve(X) là xong. Tuy nhiên trong cách viết đệ quy trực tiếp, thủ tục Solve có lời gọi tới chính nó, còn trong cách viết đệ quy tương hỗ, thủ tục Solve chứa lời gọi tới thủ tục SolveOdd và SolveEven, hai thủ tục này lại chứa trong nó lời gọi ngược về thủ tục Solve.
Đối với những bài toán nêu trên, việc thiết kế các giải thuật đệ quy tương ứng khá thuận lợi vì cả hai đều thuộc dạng tính giá trị hàm mà định nghĩa quy nạp của hàm đó được xác định dễ dàng.
Nhưng không phải lúc nào phép giải đệ quy cũng có thể nhìn nhận và thiết kế dễ dàng như vậy. Thế thì vấn đề gì cần lưu tâm trong phép giải đệ quy?. Có thể tìm thấy câu trả lời qua việc giải đáp các câu hỏi sau:
1. Có thể định nghĩa được bài toán dưới dạng phối hợp của những bài toán cùng loại nhưng nhỏ hơn hay không ? Khái niệm "nhỏ hơn" là thế nào ?
2. Trường hợp đặc biệt nào của bài toán sẽ được coi là trường hợp tầm thường và có thể giải ngay được để đưa vào phần neo của phép giải đệ quy
3.3.4. Bài toán Tháp Hà Nội
Đây là một bài toán mang tính chất một trò chơi, tương truyền rằng tại ngôi đền Benares có ba cái cọc kim cương. Khi khai sinh ra thế giới, thượng đế đặt n cái đĩa bằng vàng chồng lên nhau theo thứ tự giảm dần của đường kính tính từ dưới lên, đĩa to nhất được đặt trên một chiếc cọc. 
 
Tháp Hà Nội
Các nhà sư lần lượt chuyển các đĩa sang cọc khác theo luật:
•	Khi di chuyển một đĩa, phải đặt nó vào một trong ba cọc đã cho
•	Mỗi lần chỉ có thể chuyển một đĩa và phải là đĩa ở trên cùng
•	Tại một vị trí, đĩa nào mới chuyển đến sẽ phải đặt lên trên cùng
•	Đĩa lớn hơn không bao giờ được phép đặt lên trên đĩa nhỏ hơn (hay nói cách khác: một đĩa chỉ được đặt trên cọc hoặc đặt trên một đĩa lớn hơn)
Ngày tận thế sẽ đến khi toàn bộ chồng đĩa được chuyển sang một cọc khác. Trong trường hợp có 2 đĩa, cách làm có thể mô tả như sau:
Chuyển đĩa nhỏ sang cọc 3, đĩa lớn sang cọc 2 rồi chuyển đĩa nhỏ từ cọc 3 sang cọc 2.
Những người mới bắt đầu có thể giải quyết bài toán một cách dễ dàng khi số đĩa là ít, nhưng họ sẽ gặp rất nhiều khó khăn khi số các đĩa nhiều hơn. Tuy nhiên, với tư duy quy nạp toán học và một máy tính thì công việc trở nên khá dễ dàng:
Có n đĩa.
•	Nếu n = 1 thì ta chuyển đĩa duy nhất đó từ cọc 1 sang cọc 2 là xong.
•	Giả sử rằng ta có phương pháp chuyển được n - 1 đĩa từ cọc 1 sang cọc 2, thì cách chuyển n - 1 đĩa từ cọc x sang cọc y (1  x, y  3) cũng tương tự.
•	Giả sử ràng ta có phương pháp chuyển được n - 1 đĩa giữa hai cọc bất kỳ. Để chuyển n đĩa từ cọc x sang cọc y, ta gọi cọc còn lại là z ( = 6 - x - y). Coi đĩa to nhất là … cọc, chuyển n - 1 đĩa còn lại từ cọc x sang cọc z, sau đó chuyển đĩa to nhất đó sang cọc y và cuối cùng lại coi đĩa to nhất đó là cọc, chuyển n - 1 đĩa còn lại đang ở cọc z sang cọc y chồng lên đĩa to nhất.
Cách làm đó được thể hiện trong thủ tục đệ quy dưới đây:
procedure Move(n, x, y: Integer); 
begin
if n = 1 then WriteLn(''Chuyển 1 đĩa từ '', x, '' sang '', y)
else
begin
Move(n - 1, x, 6 - x - y);
Move(1, x, y); {Chuyển đĩa to nhất từ x sang y}
Move(n - 1, 6 - x - y, y); 
end;
end;
Chương trình chính rất đơn giản, chỉ gồm có 2 việc: Nhập vào số n và gọi Move(n, 1, 2).
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'3.4', N'Hiệu lực của đệ quy', N'..\..\public\data\C3\3_4.docx', 3, N'3.4. HIỆU LỰC CỦA ĐỆ QUY
Qua các ví dụ trên, ta có thể thấy đệ quy là một công cụ mạnh để giải các bài toán. Có những bài toán mà bên cạnh giải thuật đệ quy vẫn có những giải thuật lặp khá đơn giản và hữu hiệu. Chẳng hạn bài toán tính giai thừa hay tính số Fibonacci. Tuy vậy, đệ quy vẫn có vai trò xứng đáng của nó, có nhiều bài toán mà việc thiết kế giải thuật đệ quy đơn giản hơn nhiều so với lời giải lặp và trong một số trường hợp chương trình đệ quy hoạt động nhanh hơn chương trình viết không có đệ quy. Giải thuật cho bài Tháp Hà Nội và thuật toán sắp xếp kiểu phân đoạn (QuickSort) mà ta sẽ nói tới trong các bài sau là những ví dụ.
Có một mối quan hệ khăng khít giữa đệ quy và quy nạp toán học. Cách giải đệ quy cho một bài toán dựa trên việc định rõ lời giải cho trường hợp suy biến (neo) rồi thiết kế làm sao để lời giải của bài toán được suy ra từ lời giải của bài toán nhỏ hơn cùng loại như thế. Tương tự như vậy, quy nạp toán học chứng minh một tính chất nào đó ứng với số tự nhiên cũng bằng cách chứng minh tính chất đó đúng với một số trường hợp cơ sở (thường người ta chứng minh nó đúng với 0 hay đúng với 1) và sau đó chứng minh tính chất đó sẽ đúng với n bất kỳ nếu nó đã đúng với mọi số tự nhiên nhỏ hơn n.
Do đó ta không lấy làm ngạc nhiên khi thấy quy nạp toán học được dùng để chứng minh các tính chất có liên quan tới giải thuật đệ quy. Chẳng hạn: Chứng minh số phép chuyển đĩa để giải bài toán Tháp Hà Nội với n đĩa là 2n-1:
Rõ ràng là tính chất này đúng với n = 1, bởi ta cần 21 - 1 = 1 lần chuyển đĩa để thực hiện yêu cầu
Với n > 1; Giả sử rằng để chuyển n - 1 đĩa giữa hai cọc ta cần 2n-1 - 1 phép chuyển đĩa, khi đó để chuyển n đĩa từ cọc x sang cọc y, nhìn vào giải thuật đệ quy ta có thể thấy rằng trong trường hợp này nó cần (2n-1 - 1) + 1 + (2n-1 - 1) = 2n - 1 phép chuyển đĩa. Tính chất được chứng minh đúng với n
Vậy thì công thức này sẽ đúng với mọi n.
Thật đáng tiếc nếu như chúng ta phải lập trình với một công cụ không cho phép đệ quy, nhưng như vậy không có nghĩa là ta bó tay trước một bài toán mang tính đệ quy. Mọi giải thuật đệ quy đều có cách thay thế bằng một giải thuật không đệ quy (khử đệ quy), có thể nói được như vậy bởi tất cả các chương trình con đệ quy sẽ đều được trình dịch chuyển thành những mã lệnh không đệ quy trước khi giao cho máy tính thực hiện.
Việc tìm hiểu cách khử đệ quy một cách "máy móc" như các chương trình dịch thì chỉ cần hiểu rõ cơ chế xếp chồng của các thủ tục trong một dây chuyền gọi đệ quy là có thể làm được. Nhưng muốn khử đệ quy một cách tinh tế thì phải tuỳ thuộc vào từng bài toán mà khử đệ quy cho khéo. Không phải tìm đâu xa, những kỹ thuật giải công thức truy hồi bằng quy hoạch động là ví dụ cho thấy tính nghệ thuật trong những cách tiếp cận bài toán mang bản chất đệ quy để tìm ra một giải thuật không đệ quy đầy hiệu quả.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'3.5', N'Bài tập về đệ quy', N'..\..\public\data\C3\EX.docx', 3, N'3.5. BÀI TẬP
Bài 1
Viết một hàm đệ quy tính ước số chung lớn nhất của hai số tự nhiên a, b không đồng thời bằng 0, chỉ rõ đâu là phần neo, đâu là phần đệ quy.
Bài 2
Viết một hàm đệ quy tính "C" _"n" ^"k"  theo công thức truy hồi sau:
"C" _"n" ^"0"  = "C" _"n" ^"n"  = 1
Với 0 < k < n: "C" _"n" ^"k"  = "C" _"n-1" ^"k-1"  + "C" _"n-1" ^"k" 
Bài 3
Nêu rõ các bước thực hiện của giải thuật cho bài Tháp Hà Nội trong trường hợp n = 3. Viết chương trình giải bài toán Tháp Hà Nội không đệ quy

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'4.1', N'Khái niệm danh sách', N'..\..\public\data\C4\4_1.docx', 4, N'4.1. KHÁI NIỆM DANH SÁCH
Danh sách là một tập sắp thứ tự các phần tử cùng một kiểu. Đối với danh sách, người ta có một số thao tác: Tìm một phần tử trong danh sách, chèn một phần tử vào danh sách, xoá một phần tử khỏi danh sách, sắp xếp lại các phần tử trong danh sách theo một trật tự nào đó v.v…
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'4.2', N'Biểu diễn danh sách trong máy tính', N'..\..\public\data\C4\4_2.docx', 4, N'4.2. BIỂU DIỄN DANH SÁCH TRONG MÁY TÍNH
Việc cài đặt một danh sách trong máy tính tức là tìm một cấu trúc dữ liệu cụ thể mà máy tính hiểu được để lưu các phần tử của danh sách đồng thời viết các đoạn chương trình con mô tả các thao tác cần thiết đối với danh sách.
4.2.1. Cài đặt bằng mảng một chiều
Khi cài đặt danh sách bằng một mảng, thì có một biến nguyên n lưu số phần tử hiện có trong danh sách. Nếu mảng được đánh số bắt đầu từ 1 thì các phần tử trong danh sách được cất giữ trong mảng bằng các phần tử được đánh số từ 1 tới n. 
Chèn phần tử vào mảng:
Mảng ban đầu:
 
Nếu muốn chèn một phần tử V vào mảng tại vị trí p, ta phải: 
Dồn tất cả các phần tử từ vị trí p tới tới vị trí n về sau một vị trí:
 
Đặt giá trị V vào vị trí p:
 
Tăng n lên 1
Xoá phần tử khỏi mảng:
Mảng ban đầu:
 
Muốn xoá phần tử thứ p của mảng mà vẫn giữ nguyên thứ tự các phần tử còn lại, ta phải: Dồn tất cả các phần tử từ vị trí p + 1 tới vị trí n lên trước một vị trí:
 
Giảm n đi 1
 
Trong trường hợp cần xóa một phần tử mà không cần duy trì thứ tự của các phần tử khác, ta chỉ cần đảo giá trị của phần tử cần xóa cho phần tử cuối cùng rồi giảm số phần tử của mảng (n) đi 1.
4.2.2.	Cài đặt bằng danh sách liên kết đơn
Danh sách liên kết đơn gồm các nút được nối với nhau theo một chiều. Mỗi nút là một bản ghi (record) gồm hai trường:
Trường thứ nhất chứa giá trị lưu trong nút đó
Trường thứ hai chứa liên kết (con trỏ) tới nút kế tiếp, tức là chứa một thông tin đủ để biết nút kế tiếp nút đó trong danh sách là nút nào, trong trường hợp là nút cuối cùng (không có nút kế tiếp), trường liên kết này được gán một giá trị đặc biệt.
 
Cấu trúc nút của danh sách liên kết đơn
Nút đầu tiên trong danh sách được gọi là chốt của danh sách liên kết đơn (Head). Để duyệt danh sách liên kết đơn, ta bắt đầu từ chốt, dựa vào trường liên kết để đi sang nút kế tiếp, đến khi gặp giá trị đặc biệt (duyệt qua nút cuối) thì dừng lại
 
Danh sách liên kết đơn
Chèn phần tử vào danh sách liên kết đơn:
Danh sách ban đầu:
 
Muốn chèn thêm một nút chứa giá trị V vào vị trí của nút p, ta phải:
a) Tạo ra một nút mới NewNode chứa giá trị V:
 
b) Tìm nút q là nút đứng trước nút p trong danh sách (nút có liên kết tới p).
     b1) Nếu tìm thấy thì chỉnh lại liên kết: q liên kết tới NewNode, NewNode liên kết tới p
 
     b2) Nếu không có nút đứng trước nút p trong danh sách thì tức là p = Head, ta chỉnh lại liên kết: NewNode liên kết tới Head (cũ) và đặt lại Head = NewNode
Xoá phần tử khỏi danh sách liên kết đơn:
Danh sách ban đầu:
 
Muốn huỷ nút p khỏi danh sách liên kết đơn, ta phải:
Tìm nút q là nút đứng liền trước nút p trong danh sách (nút có liên kết tới p)
Nếu tìm thấy thì chỉnh lại liên kết: q liên kết thẳng tới nút liền sau p, khi đó quá trình duyệt danh sách bắt đầu từ Head khi duyệt tới q sẽ nhảy qua không duyệt p nữa. Trên thực tế khi cài đặt bằng các biến động và con trỏ, ta nên có thao tác giải phóng bộ nhớ đã cấp cho nút p
 
Nếu không có nút đứng trước nút p trong danh sách thì tức là p = Head, ta chỉ việc đặt lại Head bằng nút đứng kế tiếp Head (cũ) trong danh sách. Sau đó có thể giải phóng bộ nhớ cấp cho nút p (Head cũ)
4.2.3.	Cài đặt bằng danh sách liên kết đôi
Danh sách liên kết đôi gồm các nút được nối với nhau theo hai chiều. Mỗi nút là một bản ghi (record) gồm ba trường:48
•	Trường thứ nhất chứa giá trị lưu trong nút đó
•	Trường thứ hai (Next) chứa liên kết (con trỏ) tới nút kế tiếp, tức là chứa một thông tin đủ để biết nút kế tiếp nút đó là nút nào, trong trường hợp là nút cuối cùng (không có nút kế tiếp), trường liên kết này được gán một giá tị đặc biệt.
•	Trường thứ ba (Prev) chứa liên kết (con trỏ) tới nút liền trước, tức là chứa một thông tin đủ để biết nút đứng trước nút đó trong danh sách là nút nào, trong trường hợp là  nút đầu tiên (không có nút liền trước) trường này được gán một giá trị đặc biệt.
 
Cấu trúc nút của danh sách liên kết đôi
Khác với danh sách liên kết đơn, danh sách liên kết đôi có hai chốt: Nút đầu tiên trong danh sách được gọi là First, nút cuối cùng trong danh sách được gọi là Last. Để duyệt danh sách liên kết đôi, ta có hai cách: Hoặc bắt đầu từ First, dựa vào liên kết Next để đi sang nút kế tiếp, đến khi gặp giá trị đặc biệt (duyệt qua nút cuối) thì dừng lại. Hoặc bắt đầu từ Last, dựa vào liên kết Prev để đi sang nút liền trước, đến khi gặp giá trị đặc biệt (duyệt qua nút đầu) thì dừng lại
 
Danh sách liên kết đôi
Việc chèn / xoá vào danh sách liên kết đôi cũng đơn giản chỉ là kỹ thuật chỉnh lại các mối liên kết giữa các nút cho hợp lý, ta coi như bài tập.
4.2.4.	Cài đặt bằng danh sách liên kết vòng một hướng
Trong danh sách liên kết đơn, phần tử cuối cùng trong danh sách có trường liên kết được gán một giá trị đặc biệt (thường sử dụng nhất là giá trị nil). Nếu ta cho trường liên kết của phần tử cuối cùng trỏ thẳng về phần tử đầu tiên của danh sách thì ta sẽ được một kiểu danh sách mới gọi là danh sách liên kết vòng một hướng.
 
Danh sách liên kết vòng một hướng
Đối với danh sách liên kết vòng, ta chỉ cần biết một nút bất kỳ của danh sách là ta có thể duyệt được hết các nút trong danh sách bằng cách đi theo hướng của các liên kết. Chính vì lý do này, khi chèn xoá vào danh sách liên kết vòng, ta không phải xử lý các trường hợp riêng khi chèn xoá tại vị trí của chốt
4.2.5.	Cài đặt bằng danh sách liên kết vòng hai hướng
Danh sách liên kết vòng một hướng chỉ cho ta duyệt các nút của danh sách theo một chiều, nếu cài đặt bằng danh sách liên kết vòng hai hướng thì ta có thể duyệt các nút của danh sách cả theo chiều ngược lại nữa. Danh sách liên kết vòng hai hướng có thể tạo thành từ danh sách liên kết đôi nếu ta cho trường Prev của nút First trỏ thẳng tới nút Last còn trường Next của nút Last thì trỏ thẳng về nút First.
 
Danh sách liên kết vòng hai hướng
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'4.3', N'Bài tập về danh sách', N'..\..\public\data\C4\EX.docx', 4, N'4.3. Bài tập
Bài 1
Lập chương trình quản lý danh sách học sinh, tuỳ chọn loại danh sách cho phù hợp, chương trình có những chức năng sau: (Hồ sơ một học sinh giả sử có: Tên, lớp, số điện thoại, điểm TB …)
Cho phép nhập danh sách học sinh từ bàn phím hay từ file. Cho phép in ra danh sách học sinh gồm có tên và xếp loại Cho phép in ra danh sách học sinh gồm các thông tin đầy đủ
Cho phép nhập vào từ bàn phím một tên học sinh và một tên lớp, tìm xem có học sinh có tên nhập vào trong lớp đó không ? Nếu có thì in ra số điện thoại của học sinh đó
Cho phép vào một hồ sơ học sinh mới từ bàn phím, bổ sung học sinh đó vào danh sách học sinh, in ra danh sách mới.
Cho phép nhập vào từ bàn phím tên một lớp, loại bỏ tất cả các học sinh của lớp đó khỏi danh sách, in ra danh sách mới.
Có chức năng sắp xếp danh sách học sinh theo thứ tự giảm dần của điểm trung bình
Cho phép nhập vào hồ sơ một học sinh mới từ bàn phím, chèn học sinh đó vào danh sách mà không làm thay đổi thứ tự đã sắp xếp, in ra danh sách mới.
Cho phép lưu trữ lại trên đĩa danh sách học sinh khi đã thay đổi.
Bài 2
Có n người đánh số từ 1 tới n ngồi quanh một vòng tròn (n  10000), cùng chơi một trò chơi: Một người nào đó đếm 1, người kế tiếp, theo chiều kim đồng hồ đếm 2… cứ như vậy cho tới người đếm đến một số nguyên tố thì phải ra khỏi vòng tròn, người kế tiếp lại đếm bắt đầu từ 1: Hãy lập chương trình
Nhập vào 2 số n và S từ bàn phím
•	Cho biết nếu người thứ nhất là người đếm 1 thì người còn lại cuối cùng trong vòng tròn là người thứ mấy
•	Cho biết nếu người còn lại cuối cùng trong vòng tròn là người thứ k thì người đếm 1 là người nào ?
Giải quyết hai yêu cầu trên trong trường hợp: đầu tiên trò chơi được đếm theo chiều kim đồng hồ, khi có một người bị ra khỏi cuộc chơi thì vẫn là người kế tiếp đếm 1 nhưng quá trình đếm ngược lại (tức là ngược chiều kim đồng hồ)
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'5.1', N'Ngăn xếp (Stack)', N'..\..\public\data\C5\5_1.docx', 5, N'5.1. NGĂN XẾP (STACK)
Ngăn xếp là một kiểu danh sách được trang bị hai phép toán bổ sung một phần tử vào cuối danh sách và loại bỏ một phần tử cũng ở cuối danh sách.
Có thể hình dung ngăn xếp như hình ảnh một chồng đĩa, đĩa nào được đặt vào chồng sau cùng sẽ nằm trên tất cả các đĩa khác và sẽ được lấy ra đầu tiên. Vì nguyên tắc"vào sau ra trước" đó, Stack còn có tên gọi là danh sách kiểu LIFO (Last In First Out) và vị trí cuối danh sách được gọi là đỉnh (Top) của Stack.
5.1.1.	Mô tả Stack bằng mảng
Khi mô tả Stack bằng mảng:
Việc bổ sung một phần tử vào Stack tương đương với việc thêm một phần tử vào cuối mảng. Việc loại bỏ một phần tử khỏi Stack tương đương với việc loại bỏ một phần tử ở cuối mảng. Stack bị tràn khi bổ sung vào mảng đã đầy
Stack là rỗng khi số phần tử thực sự đang chứa trong mảng = 0.
program StackByArray; 
const
max = 10000; 
var
Stack: array[1..max] of Integer;
Last: Integer;

procedure StackInit; 
begin
Last := 0; 
end;

procedure Push(V: Integer); 
begin
if Last = max then WriteLn(''Stack is full'') 
else
begin
Inc(Last); Stack[Last] := V; 
end;
end;

function Pop: Integer; 
begin
if Last = 0 then WriteLn(''Stack is empty'') 
else
begin
Pop := Stack[Last]; Dec(Last); 
end;
end;

begin
StackInit;
<Test>;
end;
Khi cài đặt bằng mảng, tuy các thao tác đối với Stack viết hết sức đơn giản nhưng ở đây ta vẫn chia thành các chương trình con, mỗi chương trình con mô tả một thao tác, để từ đó về sau, ta chỉ cần biết rằng chương trình của ta có một cấu trúc Stack, còn ta mô phỏng cụ thể như thế nào thì không cần phải quan tâm nữa, và khi cài đặt Stack bằng các cấu trúc dữ liệu khác, chỉ cần sửa lại các thủ tục StackInit, Push và Pop mà thôi.
5.1.2.	Mô tả Stack bằng danh sách liên kết đơn kiểu LIFO
Khi cài đặt Stack bằng danh sách nối đơn kiểu LIFO, thì Stack bị tràn khi vùng không gian nhớ dùng cho các biến động không còn đủ để thêm một phần tử mới. Tuy nhiên, việc kiểm tra điều này rất khó bởi nó phụ thuộc vào máy tính và ngôn ngữ lập trình. Ví dụ như đối với Turbo Pascal, khi Heap còn trống 80 Bytes thì cũng chỉ đủ chỗ cho 10 biến, mỗi biến 6 Bytes mà thôi. Mặt khác, không gian bộ nhớ dùng cho các biến động thường rất lớn nên cài đặt dưới đây ta bỏ qua việc kiểm tra Stack tràn.
program StackByLinkedList; 
type
PNode = ^TNode; 
TNode = record;
Value: Integer;
Link: PNode;
end; 
var
Last: Pnode;

procedure StackInit; {Khởi tạo Stack rỗng}
begin
Last := nil; 
end;

procedure Push(V: Integer);
var
P: PNode; 
begin
New(P); P^.Value := V; 
P^.Link := Last; Last := P; 
end;

function Pop: Integer; 
var
P: PNode; 
begin
if Last = nil then WriteLn(''Stack is empty'') 
else
begin
Pop := Last^.Value; 
P := Last^.Link; 
Dispose(Last); Last := P;
end;
end;

begin
StackInit;
<Test>; 
end.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'5.2', N'Hàng đợi (Queue)', N'..\..\public\data\C5\5_2.docx', 5, N'5.2. HÀNG ĐỢI (QUEUE)
Hàng đợi là một kiểu danh sách được trang bị hai phép toán bổ sung một phần tử vào cuối danh sách (Rear) và loại bỏ một phần tử ở đầu danh sách (Front).
Có thể hình dung hàng đợi như một đoàn người xếp hàng mua vé: Người nào xếp hàng trước sẽ được mua vé trước. Vì nguyên tắc"vào trước ra trước" đó, Queue còn có tên gọi là danh sách kiểu FIFO (First In First Out).
5.2.1.	Mô tả Queue bằng mảng
Khi mô tả Queue bằng mảng, ta có hai chỉ số First và Last, First lưu chỉ số phần tử đầu Queue còn Last lưu chỉ số cuối Queue, khởi tạo Queue rỗng: First := 1 và Last := 0;
Để thêm một phần tử vào Queue, ta tăng Last lên 1 và đưa giá trị đó vào phần tử thứ Last.
Để loại một phần tử khỏi Queue, ta lấy giá trị ở vị trí First và tăng First lên 1.
Khi Last tăng lên hết khoảng chỉ số của mảng thì mảng đã đầy, không thể đẩy thêm phần tử vào nữa.
Khi First > Last thì tức là Queue đang rỗng
Như vậy chỉ một phần của mảng từ vị trí First tới Last được sử dụng làm Queue.
program QueueByArray; 
const
max = 10000; 
var
Queue: array[1..max] of Integer;
First, Last: Integer;

procedure QueueInit; {Khởi tạo một hàng đợi rỗng}
begin
First := 1; Last := 0; 
end;

procedure Push(V: Integer); {Đẩy V vào hàng đợi}
begin
if Last = max then WriteLn(''Overflow'') 
else
begin
Inc(Last);
Queue[Last] := V;
end;
end;

function Pop: Integer; 
begin
if First > Last then WriteLn(''Queue is Empty'') 
else
begin
Pop := Queue[First];
Inc(First);
end;
end; 
begin
QueueInit;
<Test>;
end;
Xem lại chương trình cài đặt Stack bằng một mảng kích thước tối đa 10000 phần tử, ta thấy rằng nếu như ta làm 6000 lần Push rồi 6000 lần Pop rồi lại 6000 lần Push thì vẫn không có vấn đề gì xảy ra. Lý do là vì chỉ số Last lưu đỉnh của Stack sẽ được tăng lên 6000 rồi lại giảm đến 0 rồi lại tăng trở lại lên 6000. Nhưng đối với cách cài đặt Queue như trên thì sẽ gặp thông báo lỗi tràn mảng, bởi mỗi lần Push, chỉ số cuối hàng đợi Last cũng tăng lên và không bao giờ bị giảm đi cả. Đó chính là nhược điểm mà ta nói tới khi cài đặt: Chỉ có các phần tử từ vị trí First tới Last là thuộc Queue, các phần tử từ vị trí 1 tới First - 1 là vô nghĩa.
Để khắc phục điều này, ta mô tả Queue bằng một danh sách vòng (biểu diễn bằng mảng hoặc cấu trúc liên kết), coi như các phần tử của mảng được xếp quanh vòng theo một hướng nào đó. Các phần tử nằm trên phần cung tròn từ vị trí First tới vị trí Last là các phần tử của Queue. Có thêm một biến n lưu số phần tử trong Queue. Việc thêm một phần tử vào Queue tương đương với việc ta dịch chỉ số Last theo vòng một vị trí rồi đặt giá trị mới vào đó. Việc loại bỏ một phần tử trong Queue tương đương với việc lấy ra phần tử tại vị trí First rồi dịch chỉ số First theo vòng.
 
Dùng danh sách vòng mô tả Queue
Lưu ý là trong thao tác Push và Pop phải kiểm tra Queue tràn hay Queue cạn nên phải cập nhật lại biến n. (Ở đây dùng thêm biến n cho dễ hiểu còn trên thực tế chỉ cần hai biến First và Last là ta có thể kiểm tra được Queue tràn hay cạn rồi)
program QueueByCList; 
const
max = 10000; 
var
Queue: array[0..max - 1] of Integer; 
i, n, First, Last: Integer;

procedure QueueInit; {Khởi tạo Queue rỗng}
begin
First := 0; 
Last := max - 1; 
n := 0; 
end;

procedure Push(V: Integer); {Đẩy giá trị V vào Queue}
begin
if n = max then WriteLn(''Queue is Full'') 
else
begin
Last := (Last + 1) mod max; 
Queue[Last] := V;
Inc(n);
end;

function Pop: Integer; 
begin
if n = 0 then WriteLn(''Queue is Empty'') 
else
begin
Pop := Queue[First];
First := (First + 1) mod max; 
Dec(n); 
end;
end;

begin
QueueInit;
<Test>; 
end.
5.2.2.	Mô tả Queue bằng danh sách liên kết đơn kiểu FIFO
Tương tự như cài đặt Stack bằng danh sách nối đơn kiểu LIFO, ta cũng không kiểm tra Queue tràn trong trường hợp mô tả Queue bằng danh sách nối đơn kiểu FIFO.
program QueueByLinkedList;
type
PNode = ^TNode; 
TNode = record 
Value: Integer;
Link: PNode;
end; 
var
First, Last: PNode; 

procedure QueueInit; 
begin
First := nil; 
end;

procedure Push(V: Integer); {Đẩy giá trị V vào Queue}
var
P: PNode; 
begin
New(P); 
P^.Value := V; 
P^.Link := nil;
if First = nil then First := P 
else 
Last^.Link := P;
Last := P; 
end;

function Pop: Integer; 
var
P: PNode; 
begin
if First = nil then WriteLn(''Queue is empty'') 
else
begin
Pop := First^.Value; 
P := First^.Link; 
Dispose(First); 
First := P; 
end;
end;

begin
QueueInit;
<Test>; 
end.

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'5.3', N'Bài tập về ngăn xếp và hàng đợi', N'..\..\public\data\C5\EX.docx', 5, N'BÀI TẬP
Bài 1
Tìm hiểu cơ chế xếp chồng của thủ tục đệ quy, phương pháp dùng ngăn xếp để khử đệ quy. Viết chương trình mô tả cách đổi cơ số từ hệ thập phân sang hệ cơ số R dùng ngăn xếp
Bài 2
Hình dưới đây là cơ cấu đường tàu tại một ga xe lửa
 
Di chuyển toa tàu
Ban đầu ở đường ray A chứa các toa tàu đánh số từ 1 tới n theo thứ tự từ trái qua phải, người ta muốn chuyển các toa đó sang đường ray C để được một thứ tự mới là một hoán vị của (1,  2, …, n) theo quy tắc: chỉ được đưa các toa tàu chạy theo đường ray theo hướng mũi tên, có thể dùng đoạn đường ray B để chứa tạm các toa tàu trong quá trình di chuyển.
a) Hãy nhập vào hoán vị cần có, cho biết có phương án chuyển hay không, và nếu có hãy đưa ra cách chuyển:
Ví dụ: n = 4; Thứ tự cần có (1, 4, 3, 2)
1) A →  C; 2) A → B; 3) A → B; 4) A →  C; 5) B → C; 6) B →  C
b) Những hoán vị nào của thứ tự các toa là có thể tạo thành trên đoạn đường ray C với luật di chuyển như trên
Bài 3
Tương tự như bài 2, nhưng với sơ đồ đường ray sau:
 
Di chuyển toa tàu (2)
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'6.1', N'Định nghĩa', N'..\..\public\data\C6\6_1.docx', 6, N'6.1. ĐỊNH NGHĨA
Cấu trúc dữ liệu trừu tượng ta quan tâm tới trong mục này là cấu trúc cây. Cây là một cấu trúc dữ liệu gồm một tập hữu hạn các nút, giữa các nút có một quan hệ phân cấp gọi là quan hệ "cha - con". Có một nút đặc biệt gọi là gốc (root).
Có thể định nghĩa cây bằng các đệ quy như sau:
•	Mỗi nút là một cây, nút đó cũng là gốc của cây ấy
•	Nếu n là một nút và n1, n2, …, nk lần lượt là gốc của các cây T1, T2, …, Tk; các cây   này đôi một không có nút chung. Thì nếu cho nút n trở thành cha của các nút n1, n2, …, nk ta sẽ được một cây mới T. Cây này có nút n là gốc còn các cây T1, T2, …, Tk trở thành các cây con (subtree) của gốc.
Để tiện, người ta còn cho phép tồn tại một cây không có nút nào mà ta gọi là cây rỗng (null tree).
Xét cây:
 
Cây
A là cha của B, C, D, còn G, H, I là con của D
Số các con của một nút được gọi là cấp của nút đó, ví dụ cấp của A là 3, cấp của B là 2, cấp của C là 0.
Nút có cấp bằng 0 được gọi là nút lá (leaf) hay nút tận cùng. Ví dụ như ở trên, các nút E, F, C, G, J, K và I là các nút là. Những nút không phải là lá được gọi là nút nhánh (branch)
Cấp cao nhất của một nút trên cây gọi là cấp của cây đó, cây ở hình trên là cây cấp 3.
Gốc của cây người ta gán cho số mức là 1, nếu nút cha có mức là i thì nút con sẽ có mức là i + 1.  Mức của cây trong hình trên được chỉ ra trong hình dưới đây:
 
Mức của các nút trên cây
Chiều cao (height) hay chiều sâu (depth) của một cây là số mức lớn nhất của nút có trên cây đó. Cây ở trên có chiều cao là 4
Một tập hợp các cây phân biệt được gọi là rừng (forest), một cây cũng là một rừng. Nếu bỏ nút gốc trên cây thì sẽ tạo thành một rừng các cây con.
Ví dụ:
•	Mục lục của một cuốn sách với phần, chương, bài, mục v.v… có cấu trúc của cây
•	Cấu trúc thư mục trên đĩa cũng có cấu trúc cây, thư mục gốc có thể coi là gốc của cây
•	đó với các cây con là các thư mục con và tệp nằm trên thư mục gốc.
•	Gia phả của một họ tộc cũng có cấu trúc cây.
•	Một biểu thức số học gồm các phép toán cộng, trừ, nhân, chia cũng có thể lưu trữ trong một cây mà các toán hạng được lưu trữ ở các nút lá, các toán tử được lưu trữ ở các nút nhánh, mỗi nhánh là một biểu thức con.
 
Cây biểu diễn biểu thức
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'6.2', N'Cây nhị phân (Binary tree)', N'..\..\public\data\C6\6_2.docx', 6, N'6.2. CÂY NHỊ PHÂN (BINARY TREE)
Cây nhị phân là một dạng quan trọng của cấu trúc cây. Nó có đặc điểm là mọi nút trên cây chỉ có tối đa hai nhánh con. Với một nút thì người ta cũng phân biệt cây con trái và cây con phải của nút đó. Cây nhị phân là cây có tính đến thứ tự của các nhánh con.
Cần chú ý tới một số dạng đặc biệt của cây nhị phân
Các cây nhị phân dưới đây được gọi là cây nhị phân suy biến (degenerate binary tree), các nút không phải là lá chỉ có một nhánh con. Cây a) được gọi là cây lệch phải, cây b) được gọi là cây lệch trái, cây c) và d) được gọi là cây zíc-zắc.
 
Các dạng cây nhị phân suy biến
Các cây trong hình dưới đây được gọi là cây nhị phân hoàn chỉnh (complete binary tree): Nếu chiều cao của cây là h thì mọi nút có mức < h - 1 đều có đúng 2 nút con. Còn nếu mọi nút có mức  h - 1 đều có đúng 2 nút con như trường hợp cây f) ở trên thì cây đó được gọi là cây nhị phân đầy đủ (full binary tree). Cây nhị phân đầy đủ là trường hợp riêng của cây nhị phân hoàn chỉnh.
 
Cây nhị phân hoàn chỉnh và cây nhị phân đầy đủ
Ta có thể thấy ngay những tính chất sau bằng phép chứng minh quy nạp:
Trong các cây nhị phân có cùng số lượng nút như nhau thì cây nhị phân suy biến có chiều cao lớn nhất, còn cây nhị phân hoàn chỉnh thì có chiều cao nhỏ nhất.
Số lượng tối đa các nút trên mức i của cây nhị phân là 2i-1, tối thiểu là 1 (i  1).
Số lượng tối đa các nút trên một cây nhị phân có chiều cao h là 2h-1, tối thiểu là h (h  1). Cây nhị phân hoàn chỉnh, không đầy đủ, có n nút thì chiều cao của nó là h = [log2(n + 1)] + 1.
Cây nhị phân đầy đủ có n nút thì chiều cao của nó là h = log2(n + 1)
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'6.3', N'Biểu diễn cây nhị phân', N'..\..\public\data\C6\6_3.docx', 6, N'6.3. BIỂU DIỄN CÂY NHỊ PHÂN
6.3.1.	Biểu diễn bằng mảng
Nếu có một cây nhị phân đầy đủ, ta có thể dễ dàng đánh số cho các nút trên cây đó theo thứ tự lần lượt từ mức 1 trở đi, hết mức này đến mức khác và từ trái sang phải đối với các nút ở mỗi mức.
 
Đánh số các nút của cây nhị phân đầy đủ để biểu diễn bằng mảng
Với cách đánh số này, con của nút thứ i sẽ là các nút thứ 2i và 2i + 1. Cha của nút thứ j là nút j div 2. Từ đó có thể lưu trữ cây bằng một mảng T, nút thứ i của cây được lưu trữ bằng phần tử T[i].
Với cây nhị phân đầy đủ ở hình trên thì khi lưu trữ bằng mảng, ta sẽ được mảng như sau:
 
Trong trường hợp cây nhị phân không đầy đủ, ta có thể thêm vào một số nút giả để được cây nhị phân đầy đủ, và gán những giá trị đặc biệt cho những phần tử trong mảng T tương ứng với những nút này. Hoặc dùng thêm một mảng phụ để đánh dấu những nút nào là nút giả tự ta thêm vào. Chính vì lý do này nên với cây nhị phân không đầy đủ, ta sẽ gặp phải sự lãng phí bộ nhớ vì có thể sẽ phải thêm rất nhiều nút giả vào thì mới được cây nhị phân đầy đủ.
Ví dụ với cây lệch trái, ta phải dùng một mảng 31 phần tử để lưu cây nhị phân chỉ gồm 5 nút
 
Nhược điểm của phương pháp biểu diễn cây bằng mảng
6.3.2.	Biểu diễn bằng cấu trúc liên kết
Khi biểu diễn cây nhị phân bằng cấu trúc liên kết, mỗi nút của cây là một bản ghi (record) gồm 3 trường:
•	Trường Info: Chứa giá trị lưu tại nút đó
•	Trường Left: Chứa liên kết (con trỏ) tới nút con trái, tức là chứa một thông tin đủ để biết nút con trái của nút đó là nút nào, trong trường hợp không có nút con trái, trường này được gán một giá trị đặc biệt.
•	Trường Right: Chứa liên kết (con trỏ) tới nút con phải, tức là chứa một thông tin đủ để biết nút con phải của nút đó là nút nào, trong trường hợp không có nút con phải, trường này được gán một giá trị đặc biệt.
 
Cấu trúc nút của cây nhị phân
Đối với cây ta chỉ cần phải quan tâm giữ lại nút gốc, bởi từ nút gốc, đi theo các hướng liên kết Left, Right ta có thể duyệt mọi nút khác.
 
Biểu diễn cây bằng cấu trúc liên kết
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'6.4', N'Phép duyệt cây nhị phân', N'..\..\public\data\C6\6_4.docx', 6, N'6.4. PHÉP DUYỆT CÂY NHỊ PHÂN
Phép xử lý các nút trên cây mà ta gọi chung là phép thăm (Visit) các nút một cách hệ thống sao cho mỗi nút chỉ được thăm một lần gọi là phép duyệt cây.
Giả sử rằng nếu như một nút không có nút con trái (hoặc nút con phải) thì liên kết Left (Right) của nút đó được liên kết thẳng tới một nút đặc biệt mà ta gọi là NIL (hay NULL), nếu cây rỗng thì nút gốc của cây đó cũng được gán bằng NIL. Khi đó có ba cách duyệt cây hay được sử dụng:
6.4.1.	Duyệt theo thứ tự trước (preorder traversal)
Trong phép duyệt theo thứ tự trước thì giá trị trong mỗi nút bất kỳ sẽ được liệt kê trước giá trị lưu trong hai nút con của nó, có thể mô tả bằng thủ tục đệ quy sau:
procedure Visit(N); 
begin
if N   nil then begin
<Output trường Info của nút N> 
Visit(Nút con trái của N); 
Visit(Nút con phải của N);
end;
end;
Quá trình duyệt theo thứ tự trước bắt đầu bằng lời gọi Visit(nút gốc).
Như cây ở hình cây cấu trúc liên kết, nếu ta duyệt theo thứ tự trước thì các giá trị sẽ lần lượt được liệt kê theo thứ tự:
A B D H I E J C F K G L
6.4.2.	Duyệt theo thứ tự giữa (inorder traversal)
Trong phép duyệt theo thứ tự giữa thì giá trị trong mỗi nút bất kỳ sẽ được liệt kê sau giá trị lưu ở nút con trái và được liệt kê trước giá trị lưu ở nút con phải của nút đó, có thể mô tả bằng thủ tục đệ quy sau:
procedure Visit(N); 
begin
if N   nil then 
begin
Visit(Nút con trái của N);
<Output trường Info của nút N> 
Visit(Nút con phải của N);
end;
end;
Quá trình duyệt theo thứ tự giữa cũng bắt đầu bằng lời gọi Visit(nút gốc).
Như cây ở hình cây cấu trúc liên kết, nếu ta duyệt theo thứ tự giữa thì các giá trị sẽ lần lượt được liệt kê theo thứ tự:
H D I B E J A K F C G L
6.4.3.	Duyệt theo thứ tự sau (postorder traversal)
Trong phép duyệt theo thứ tự sau thì giá trị trong mỗi nút bất kỳ sẽ được liệt kê sau giá trị lưu
ở hai nút con của nút đó, có thể mô tả bằng thủ tục đệ quy sau:
procedure Visit(N);
begin
if N   nil then 
begin
Visit(Nút con trái của N);
Visit(Nút con phải của N);
<Output trường Info của nút N> 
end;
end;
Quá trình duyệt theo thứ tự sau cũng bắt đầu bằng lời gọi Visit(nút gốc).
Cũng với cây ở hình cây cấu trúc liên kết,, nếu ta duyệt theo thứ tự sau thì các giá trị sẽ lần lượt được liệt kê theo thứ tự:
H I D J E B K F L G C A
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'6.5', N'Cây K_phân', N'..\..\public\data\C6\6_5.docx', 6, N'6.5. CÂY K_PHÂN
Cây K_phân là một dạng cấu trúc cây mà mỗi nút trên cây có tối đa K nút con (có tính đến  thứ tự của các nút con).
6.5.1.	Biểu diễn cây K_phân bằng mảng
Cũng tương tự như việc biểu diễn cây nhị phân, người ta có thể thêm vào cây K_phân một số nút giả để cho mỗi nút nhánh của cây K_phân đều có đúng K nút con, các nút con được xếp thứ tự từ nút con thứ nhất tới nút con thứ K, sau đó đánh số các nút trên cây K_phân bắt đầu từ 0 trở đi, bắt đầu từ mức 1, hết mức này đến mức khác và từ "trái qua phải" ở mỗi mức. 
Theo cách đánh số này, nút con thứ j của nút i là: i * K + j. Nút cha của nút x là nút (x - 1) div K. Ta có thể dùng một mảng T đánh số từ 0 để lưu các giá trị trên các nút: Giá trị tại nút thứ i được lưu trữ ở phần tử T[i].
 
Đánh số các nút của cây 3_phân để biểu diễn bằng mảng
6.5.2.	Biểu diễn cây K_phân bằng cấu trúc liên kết
Khi biểu diễn cây K_phân bằng cấu trúc liên kết, mỗi nút của cây là một bản ghi (record) gồm hai trường:
Trường Info: Chứa giá trị lưu trong nút đó.
Trường Links: Là một mảng gồm K phần tử, phần tử thứ i chứa liên kết (con trỏ) tới nút con thứ i, trong trường hợp không có nút con thứ i thì Links[i] được gán một giá trị đặc biệt.
Đối với cây K_ phân, ta cũng chỉ cần giữ lại nút gốc, bởi từ nút gốc, đi theo các hướng liên kết có thể đi tới mọi nút khác.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'6.6', N'Cây tổng quát', N'..\..\public\data\C6\6_6.docx', 6, N'6.6. CÂY TỔNG QUÁT
Trong thực tế, có một số ứng dụng đòi hỏi một cấu trúc dữ liệu dạng cây nhưng không có ràng buộc gì về số con của một nút trên cây, ví dụ như cấu trúc thư mục trên đĩa hay hệ thống đề mục của một cuốn sách. Khi đó, ta phải tìm cách mô tả một cách khoa học cấu trúc dữ liệu dạng cây tổng quát. Cũng như trường hợp cây nhị phân, người ta thường biểu diễn cây tổng quát bằng hai cách: Lưu trữ kế tiếp bằng mảng và lưu trữ bằng cấu trúc liên kết.
6.6.1.	Biểu diễn cây tổng quát bằng mảng
Để lưu trữ cây tổng quát bằng mảng, trước hết, ta đánh số các nút trên cây bắt đầu từ 1 theo một thứ tự tuỳ ý. Giả sử cây có n nút thì ta sử dụng:
Một mảng Info[1..n], trong đó Info[i] là giá trị lưu trong nút thứ i.
Một mảng Children được chia làm n đoạn, đoạn thứ i gồm một dãy liên tiếp các phần tử là chỉ số các nút con của nút i. Như vậy mảng Children sẽ chứa tất cả chỉ số của mọi nút con trên cây (ngoại trừ nút gốc) nên nó sẽ gồm n - 1 phần tử, lưu ý rằng khi chia mảng Children làm n đoạn thì sẽ có những đoạn rỗng (tương ứng với danh sách các nút con của một nút lá)
Một mảng Head[1..n + 1], để đánh dấu vị trí cắt đoạn trong mảng Children: Head[i] là vị trí đứng liền trước đoạn thứ i, hay nói cách khác: Đoạn con tính từ chỉ số Head[i] + 1 đến Head[i] của mảng Children chứa chỉ số các nút con của nút thứ i. Khi  Head[i] = Head[i+1] có nghĩa   là đoạn thứ i rỗng. Quy ước: Head[n+1] = n - 1.
Giữ lại chỉ số của nút gốc.
Ví dụ:
 
Biểu diễn cây tổng quát bằng mảng
6.6.2.	Lưu trữ cây tổng quát bằng cấu trúc liên kết
Khi lưu trữ cây tổng quát bằng cấu trúc liên kết, mỗi nút là một bản ghi (record) gồm ba trường:
Trường Info: Chứa giá trị lưu trong nút đó.
Trường FirstChild: Chứa liên kết (con trỏ) tới nút con đầu tiên của nút đó (con cả), trong trường hợp là nút lá (không có nút con), trường này được gán một giá trị đặc biệt.
Trường Sibling: Chứa liên kết (con trỏ) tới nút em kế cận bên phải (nút cùng cha với nút đang xét, khi sắp thứ tự các con thì nút đó đứng liền sau nút đang xét). Trong trường hợp không có nút em kế cận bên phải, trường này được gán một giá trị đặc biệt.
 
Cấu trúc nút của cây tổng quát
Dễ thấy được tính đúng đắn của phương pháp biểu diễn, bởi từ một nút N bất kỳ, ta có thể đi theo liên kết FirstChild để đến nút con cả, nút này chính là chốt của một danh sách nối đơn các nút con của nút N: từ nút con cả, đi theo liên kết Sibling, ta có thể duyệt tất cả các nút con của nút N.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'6.7', N'Bài tập về cây', N'..\..\public\data\C6\EX.docx', 6, N'Bài tập
Bài 1
Viết chương trình mô tả cây nhị phân dùng cấu trúc liên kết, mỗi nút chứa một số nguyên, và viết các thủ tục duyệt trước, giữa, sau.
Bài 2
Chứng minh rằng nếu cây nhị phân có x nút lá và y nút cấp 2 thì x = y + 1 
Bài 3
Chứng minh rằng nếu ta biết dãy các nút được thăm của một cây nhị phân khi duyệt theo thứ tự trước và thứ tự giữa thì có thể dựng được cây nhị phân đó. Điều này con đúng nữa không đối với thứ tự trước và thứ tự sau? Với thứ tự giữa và thứ tự sau.
Bài 4
Viết các thủ tục duyệt trước, giữa, sau không đệ quy.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'7.1', N'Biểu thức dưới dạng cây nhị phân', N'..\..\public\data\C7\7_1.docx', 7, N'7.1. BIỂU THỨC DƯỚI DẠNG CÂY NHỊ PHÂN
Chúng ta có thể biểu diễn các biểu thức số học gồm các phép toán cộng, trừ, nhân, chia bằng một cây nhị phân, trong đó các nút lá biểu thị các hằng hay các biến (các toán hạng), các nút không phải là lá biểu thị các toán tử (phép toán số học chẳng hạn). Mỗi phép toán trong một nút sẽ tác động lên hai biểu thức con nằm ở cây con bên trái và cây con bên phải của nút đó. 
Ví dụ: Cây biểu diễn biểu thức (6 / 2 + 3) * (7 - 4)
 
Biểu thức dưới dạng cây nhị phân
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'7.2', N'Các ký pháp cho cùng một biểu thức', N'..\..\public\data\C7\7_2.docx', 7, N'7.2. CÁC KÝ PHÁP CHO CÙNG MỘT BIỂU THỨC
Với cây nhị phân biểu diễn biểu thức trong hình trước đó,
•	Nếu duyệt theo thứ tự trước, ta sẽ được * + / 6 2 3 - 7 4, đây là dạng tiền tố (prefix) của biểu thức. Trong ký pháp này, toán tử được viết trước hai toán hạng tương ứng, người ta còn gọi ký pháp này là ký pháp Ba lan.
•	Nếu duyệt theo thứ tự giữa, ta sẽ được 6 / 2 + 3 * 7 - 4. Ký pháp này hơi mập mờ vì thiếu dấu ngoặc. Nếu thêm vào thủ tục duyệt inorder việc bổ sung các cặp dấu ngoặc vào mỗi biểu thức con sẽ thu được biểu thức (((6 / 2) + 3) * (7 - 4)). Ký pháp này gọi là dạng trung tố (infix) của một biểu thức (Thực ra chỉ cần thêm các dấu ngoặc đủ để tránh sự mập mờ mà thôi, không nhất thiết phải thêm vào đầy đủ các cặp dấu ngoặc).
•	Nếu duyệt theo thứ tự sau, ta sẽ được 6 2 / 3 + 7 4 - *, đây là dạng hậu tố (postfix) của biểu thức. Trong ký pháp này toán tử được viết sau hai toán hạng, người ta còn gọi ký pháp này là ký pháp nghịch đảo Balan (Reverse Polish Notation - RPN)
Chỉ có dạng trung tố mới cần có dấu ngoặc, dạng tiền tố và hậu tố không cần phải có dấu ngoặc.

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'7.3', N'Cách tính giá trị biểu thức', N'..\..\public\data\C7\7_3.docx', 7, N'7.3. CÁCH TÍNH GIÁ TRỊ BIỂU THỨC
Có một vấn đề cần lưu ý là khi máy tính giá trị một biểu thức số học gồm các toán tử hai ngôi (toán tử gồm hai toán hạng như +, -, *, /) thì máy chỉ thực hiện được phép toán đó với hai toán hạng. Nếu biểu thức phức tạp thì máy phải chia nhỏ và tính riêng từng biểu thức trung gian, sau đó mới lấy giá trị tìm được để tính tiếp. Ví dụ như biểu thức 1 + 2 + 4 máy sẽ phải tính 1 + 2 trước được kết quả là 3 sau đó mới đem 3 cộng với 4 chứ không thể thực hiện phép cộng một lúc ba số được.
Khi lưu trữ biểu thức dưới dạng cây nhị phân thì ta có thể coi mỗi nhánh con của cây đó mô tả một biểu thức trung gian mà máy cần tính khi xử lý biểu thức lớn. Như ví dụ trên, máy sẽ phải tính hai biểu thức 6 / 2 + 3 và 7 - 4 trước khi làm phép tính nhân cuối cùng. Để tính biểu thức 6 / 2 + 3 thì máy lại phải tính biểu thức 6 / 2 trước khi đem cộng với 3.
Vậy để tính một biểu thức lưu trữ trong một nhánh cây nhị phân gốc ở nút n, máy sẽ tính gần giống như hàm đệ quy sau:
function Calculate(n): Value; 
begin
if <Nút n chứa không phải là một toán tử> then 
Calculate := <Giá trị chứa trong nút n>
else 
begin
x := Calculate(nút con trái của n); 
y := Calculate(nút con phải của n); 
Calculate := x R y;
end; 
end;
(Trong trường hợp lập trình trên các hệ thống song song, việc tính giá trị biểu thức ở cây con trái và cây con phải có thể tiến hành đồng thời làm giảm đáng kể thời gian tính toán biểu thức).
Để ý rằng khi tính toán biểu thức, máy sẽ phải quan tâm tới việc tính biểu thức ở hai nhánh con trước, rồi mới xét đến toán tử ở nút gốc. Điều đó làm ta nghĩ tới phép cây theo thứ tự sau và ký pháp hậu tố. Trong những năm đầu 1950, nhà lô-gic học người Balan Jan Lukasiewicz đã chứng minh rằng biểu thức hậu tố không cần phải có dấu ngoặc vẫn có thể tính được một cách đúng đắn bằng cách đọc lần lượt biểu thức từ trái qua phải và dùng một Stack để lưu các kết quả trung gian:
Bước 1: Khởi động một Stack rỗng
Bước 2: Đọc lần lượt các phần tử của biểu thức RPN từ trái qua phải (phần tử này có thể là hằng, biến hay toán tử) với mỗi phần tử đó, ta kiểm tra:
Nếu phần tử này là một toán hạng thì đẩy giá trị của nó vào Stack.
Nếu phần tử này là một toán tử , ta lấy từ Stack ra hai giá trị (y và x) sau đó áp dụng toán tử đó vào hai giá trị vừa lấy ra, đẩy kết quả tìm được (x  y) vào Stack (ra hai vào một).
Bước 3: Sau khi kết thúc bước 2 thì toàn bộ biểu thức đã được đọc xong, trong Stack chỉ còn duy nhất một phần tử, phần tử đó chính là giá trị của biểu thức.
Ví dụ: Tính biểu thức 10 2 / 3 + 7 4 - * (tương ứng với biểu thức (10 / 2 + 3) * (7 - 4)
Đọc	Xử Lý	Stack
10	Đẩy vào stack	10
2	Đẩy vào stack	10, 2
/	Lấy 2 và 10 khỏi Stack, tính được 10/2=5, đẩy 5 vào Stack	5
3	Đẩy vào Stack	5, 3
+	Lấy 3 và 5 khỏi Stack, tính được 5+3=8, đẩy 8 vào Stack	8
7	Đẩy vào Stack	8, 7
4	Đẩy vào Stack	8, 7, 4
-	Lấy 4 và 7 khỏi Stack, tính được 7-4=3, đẩy 3 vào Stack	8, 3
*	Lấy 3 và 8 khỏi Stack, tính được 8*3=24, đẩy 24 vào Stack	24
Ta được kết quả là 24
Dưới đây ta sẽ viết một chương trình đơn giản tính giá trị biểu thức RPN. Chương trình sẽ nhận Input là biểu thức RPN gồm các số thực và các toán tử + - * / và cho Output là kết quả biểu thức đó.
Quy định khuôn dạng bắt buộc là hai số liền nhau trong biểu thức RPN phải viết cách nhau ít nhất một dấu cách. Để quá trình đọc một phần tử trong biểu thức RPN được dễ dàng hơn, sau bước nhập liệu, ta có thể hiệu chỉnh đôi chút biểu thức RPN về khuôn dạng dễ đọc nhất. Chẳng hạn như thêm và bớt một số dấu cách trong Input để mỗi phần tử (toán hạng, toán tử) đều cách nhau đúng một dấu cách, thêm một dấu cách vào cuối biểu thức RPN. Khi đó quá trình đọc lần lượt các phần tử trong biểu thức RPN có thể làm như sau:
T := '''';
for p := 1 to Length(RPN) do 
if RPN[p]  '' '' then T := T + RPN[p] 
else 
begin
<Xử lý phần tử T>
T := ''''; 
end;
Để đơn giản, chương trình không kiểm tra lỗi viết sai biểu thức RPN, việc đó chỉ là thao tác tỉ mỉ chứ không phức tạp lắm, chỉ cần xem lại thuật toán và cài thêm các mô-đun bắt lỗi tại mỗi bước.
Ví dụ về Input / Output của chương trình:
Enter RPN Expression: 10 2 / 3 + 4 7 - *
10 2 / 3 + 4 7 - * = 24.0000
P_2_07_1.PAS * Tính giá trị biểu thức RPN
{$N+,E+}
program CalculateRPNExpression; 
const
Opt = [''+'', ''-'', ''*'', ''/''];
var
T, RPN: String;
Stack: array[1..255] of Extended; 
p, Last: Integer;

procedure StackInit; 
begin
Last := 0; 
end;

procedure Push(V: Extended); 
begin
Inc(Last); 
Stack[Last] := V; 
end;

function Pop: Extended; 
begin
Pop := Stack[Last]; 
Dec(Last); 
end;

procedure Refine(var S: String); 
var
i: Integer; 
begin
S := S + '' '';
for i := Length(S) - 1 downto 1 do
if (S[i] in Opt) or (S[i + 1] in Opt) then 
Insert('' '', S, i + 1);
for i := Length(S) - 1 downto 1 do
if (S[i] = '' '') and (S[i + 1] = '' '') then 
Delete(S, i + 1, 1);
end;

procedure Process(T: String); 
var
x, y: Extended; e: Integer;
begin
if not (T[1] in Opt) then 
begin
Val(T, x, e); Push(x); 
end
else 
begin
y := Pop; 
x := Pop;
case T[1] of
''+'': x := x + y;
''-'': x := x - y;
''*'': x := x * y;
''/'': x := x / y; 
end;
Push(x); {Vào một}
end;
end;

begin
Write(''Enter RPN Expression: ''); 
ReadLn(RPN); 
Refine(RPN);
StackInit;
T := '''';
for p := 1 to Length(RPN) do 
if RPN[p] <> '' '' then T := T + RPN[p]
else
begin
Process(T);
T := ''''; {Đặt lại T để chuẩn bị đọc phần tử mới}
end;
WriteLn(RPN, '' = '', Pop:0:4); {In giá trị biểu thức RPN được lưu trong Stack}
end.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'7.4', N'Chuyển từ dạng trung tố sang dạng hậu tố', N'..\..\public\data\C7\7_4.docx', 7, N'7.4. CHUYỂN TỪ DẠNG TRUNG TỐ SANG DẠNG HẬU TỐ
Có thể nói rằng việc tính toán biểu thức viết bằng ký pháp nghịch đảo Balan là khoa học hơn, máy móc, và đơn giản hơn việc tính toán biểu thức viết bằng ký pháp trung tố. Chỉ riêng việc không phải xử lý dấu ngoặc đã cho ta thấy ưu điểm của ký pháp RPN. Chính vì lý do này, các chương trình dịch vẫn cho phép lập trình viên viết biểu thức trên ký pháp trung tố theo thói quen, nhưng trước khi dịch ra các lệnh máy thì tất cả các biểu thức đều được chuyển về dạng RPN. Vấn đề đặt ra là phải có một thuật toán chuyển biểu thức dưới dạng trung tố về dạng RPN một cách hiệu quả, và dưới đây ta trình bày thuật toán đó:
Thuật toán sử dụng một Stack để chứa các toán tử và dấu ngoặc mở. Thủ tục Push(V) để đẩy một phần tử vào Stack, hàm Pop để lấy ra một phần tử từ Stack, hàm Get để đọc giá trị phần tử nằm ở đỉnh Stack mà không lấy phần tử đó ra. Ngoài ra mức độ ưu tiên của các toán tử được quy định bằng hàm Priority như sau: Ưu tiên cao nhất là dấu "*" và "/" với Priority là 2, tiếp theo là dấu "+" và "-" với Priority là 1, ưu tiên thấp nhất là dấu ngoặc mở "(" với Priority là 0.
Stack := ;
for <Phần tử T đọc được từ biểu thức infix> do
{T có thể là hằng, biến, toán tử hoặc dấu ngoặc được đọc từ biểu thức infix theo thứ tự từ trái qua phải}
case T of
''('': Push(T); 
'')'':
repeat
x := Pop;
if x ''('' then Output(x); 
until x = ''('';
''+'', ''-'', ''*'', ''/'':
begin
while (Stack  ) and (Priority(T)   Priority(Get)) do Output(Pop); Push(T);
end;
else Output(T); 
end;
while (Stack  ) do Output(Pop);
Ví dụ với biểu thức trung tố (2 * 3 + 7 / 8) * (5 - 1)
Đọc	Xử lý	Stack	Output
(	Đẩy vào Stack	(	
2	Hiển thị	(	2
*	Phép “*” được ưu tiên hơn phần tử ở đỉnh Stack là “(“, đẩy “*” vào Stack	(*	
3	Hiển thị	(*	2 3
+	Phép “+” ưu tiên không cao hơn phần tử ở đỉnh Stack là “*”, lấy ra và hiển thị “*”. So sánh tiếp, thấy phép “+” được ưu tiên cao hơn phần tử ở đỉnh Stack là “(“, đấy “+” vào Stack	(+	2 3 *
7	Hiển thị	(+	2 3 * 7
/	phép “/” được ưu tiên hơn phần tử ở đỉnh Stack là “+”, đấy “/” vào Stack	(+/	
8	Hiển thị	(+/	2 3 * 7 8
)	Lấy ra và hiển thị các phần tử trong Stack tới khi lấy phải dấu ngoặc mở		2 3 * 7 8 / +
*	Stack đang là rỗng, đẩy * vào Stack	*	
(	Đẩy vào Stack	*(	
5	Hiển thị	*(	2 3 * 7 8 / + 5
-	phép “-“ được ưu tiên hơn phần tử ở đỉnh Stack là “(“, đẩy “-“ vào Stack	*(-	
1	Hiển thị	*(-	2 3 * 7 8 / + 5 1
)	Lấy ra và hiển thị các phần tử ở đỉnh Stack cho tới khi lấy phải dấu ngoặc mở	*	2 3 * 7 8 / + 5 1 -
Hết	Lấy ra và hiển thị hết các phần tử còn lai trong Stack		2 3 * 7 8 / + 5 1 - *

Dưới đây là chương trình chuyển biểu thức viết ở dạng trung tố sang dạng RPN. Biểu thức trung tố đầu vào sẽ được hiệu chỉnh sao cho mỗi thành phần của nó được cách nhau đúng một dấu cách, và thêm một dấu cách vào cuối cho dễ tách các phần tử ra để xử lý. Vì Stack chỉ dùng để chứa các toán tử và dấu ngoặc mở nên có thể mô tả Stack dưới dạng xâu ký tự cho đơn giản.
Ví dụ về Input / Output của chương trình:
Infix:	(10 * 3 + 7 / 8) * (5 - 1) 
Refined: ( 10 * 3 + 7 / 8 ) * ( 5 - 1 )
RPN: 10 3 * 7 8 / + 5 1 - *
P_2_07_2.PAS * Chuyển biểu thức trung tố sang dạng RPN
program ConvertInfixToRPN;
const
Opt = [''('', '')'', ''+'', ''-'', ''*'', ''/''];
var
T, Infix, Stack: String; {Stack dùng để chứa toán tử và dấu ngoặc mở nên dùng String cho tiện}
p: Integer;

{Các thao tác đối với Stack}
procedure StackInit; begin
Stack := ''''; end;

procedure Push(V: Char); 
begin
Stack := Stack + V; 
end;

function Pop: Char; 
begin
Pop := Stack[Length(Stack)];
Dec(Stack[0]);
end;

function Get: Char; 
begin
Get := Stack[Length(Stack)]; 
end;

procedure Refine(var S: String); {Hiệu chỉnh biểu thức trung tố về khuôn dạng dễ đọc nhất}
var
i: Integer; 
begin
S := S + '' '';
for i := Length(S) - 1 downto 1 do {Thêm những dấu cách trước và sau mỗi toán tử và dấu ngoặc}
if (S[i] in Opt) or (S[i + 1] in Opt) then Insert('' '', S, i + 1);
for i := Length(S) - 1 downto 1 do {Xoá những dấu cách thừa}
if (S[i] = '' '') and (S[i + 1] = '' '') then Delete(S, i + 1, 1);
end;

function Priority(Ch: Char): Integer; {Hàm lấy mức độ ưu tiên của Ch}
begin
case ch of
''*'', ''/'': Priority := 2;
''+'', ''-'': Priority := 1; 
''('': Priority := 0;
end; 
end;

procedure Process(T: String); {Xử lý một phần tử đọc được từ biểu thức trung tố}
var
c, x: Char; 
begin
c := T[1];
if not (c in Opt) then Write(T, '' '') 
else
case c of
''('': Push(c); 
'')'': repeat
x := Pop;
if x <> ''('' then Write(x, '' ''); 
until x = ''('';
''+'', ''-'', ''*'', ''/'':
begin
while (Stack <> '''') and (Priority(c) <= Priority(Get)) do Write(Pop, '' '');
Push(c); end;
end;
end;

begin
Write(''Infix = ''); 
ReadLn(Infix); 
Refine(Infix);
WriteLn(''Refined: '', Infix);
Write(''RPN: '');
T := '''';
for p := 1 to Length(Infix) do
if Infix[p] <> '' '' then T := T + Infix[p] 
else
begin
Process(T);
T := '''';
end;
while Stack <> '''' do Write(Pop, '' ''); 
WriteLn;
end.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'7.5', N'Xây dựng cây nhị phân biểu diễn biểu thức', N'..\..\public\data\C7\7_5.docx', 7, N'7.5. XÂY DỰNG CÂY NHỊ PHÂN BIỂU DIỄN BIỂU THỨC
Ngay trong phần đầu tiên, chúng ta đã biết rằng các dạng biểu thức trung tố, tiền tố và hậu tố đều có thể được hình thành bằng cách duyệt cây nhị phân biểu diễn biểu thức đó theo các trật tự khác nhau. Vậy tại sao không xây dựng ngay cây nhị phân biểu diễn biểu thức đó rồi thực hiện các công việc tính toán ngay trên cây?. Khó khăn gặp phải chính là thuật toán xây dựng cây nhị phân trực tiếp từ dạng trung tố có thể kém hiệu quả, trong khi đó từ dạng hậu tố lại có thể khôi phục lại cây nhị phân biểu diễn biểu thức một cách rất đơn giản, gần giống như quá trình tính toán biểu thức hậu tố:
Bước 1: Khởi tạo một Stack rỗng dùng để chứa các nút trên cây
Bước 2: Đọc lần lượt các phần tử của biểu thức RPN từ trái qua phải (phần tử này có thể là hằng, biến hay toán tử) với mỗi phần tử đó:
Tạo ra một nút mới N chứa phần tử mới đọc được
Nếu phần tử này là một toán tử, lấy từ Stack ra hai nút (theo thứ tự là y và x), sau đó đem liên kết trái của N trỏ đến x, đem liên kết phải của N trỏ đến y.
Đẩy nút N vào Stack
Bước 3: Sau khi kết thúc bước 2 thì toàn bộ biểu thức đã được đọc xong, trong Stack chỉ còn duy nhất một phần tử, phần tử đó chính là gốc của cây nhị phân biểu diễn biểu thức.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'7.6', N'Bài tập về biểu thức', N'..\..\public\data\C7\EX.docx', 7, N'Bài tập
Bài 1
Viết chương trình chuyển biểu thức trung tố sang dạng RPN, biểu thức trung tố có cả những phép toán một ngôi: Phép lấy số đối (-x), phép luỹ thừa xy (x^y), lời gọi hàm số học (sqrt, exp, abs v.v…)
Bài 2
Viết chương trình chuyển biểu thức logic dạng trung tố sang dạng RPN. Ví dụ: Chuyển: a and b or c and d thành: a b and c d and or
Bài 3
Chuyển các biểu thức sau đây ra dạng RPN
a) A * (B + C) b) A + B / C + D
c) A * (B + -C)	
d) A - (B + C)d/e
e) A and B or C	
f) A and (B or not C)
g) (A or B) and (C or (D and not E))	
h) (A = B) or (C = D)
i) (A < 9) and (A > 3) or not (A > 0)
j) ((A > 0) or (A < 0)) and (B * B - 4 * A * C < 0)
Bài 4
Viết chương trình tính biểu thức logic dạng RPN với các toán tử and, or, not và các toán hạng là TRUE hay FALSE.
Bài 5
Viết chương trình hoàn chỉnh tính giá trị biểu thức trung tố.

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.1', N'Bài toán sắp xếp', N'..\..\public\data\C8\8_1.docx', 8, N'8.1. BÀI TOÁN SẮP XẾP
Sắp xếp là quá trình bố trí lại các phần tử của một tập đối tượng nào đó theo một thứ tự nhất định. Chẳng hạn như thứ tự tăng dần (hay giảm dần) đối với một dãy số, thứ tự từ điển đối với các từ v.v… Yêu cầu về sắp xếp thường xuyên xuất hiện trong các ứng dụng Tin học với các mục đích khác nhau: sắp xếp dữ liệu trong máy tính để tìm kiếm cho thuận lợi, sắp xếp các kết quả xử lý để in ra trên bảng biểu v.v…
Nói chung, dữ liệu có thể xuất hiện dưới nhiều dạng khác nhau, nhưng ở đây ta quy ước: Một tập các đối tượng cần sắp xếp là tập các bản ghi (records), mỗi bản ghi bao gồm một số trường (fields) khác nhau. Nhưng không phải toàn bộ các trường dữ liệu trong bản ghi đều được xem xét đến trong quá trình sắp xếp mà chỉ là một trường nào đó (hay một vài trường nào đó) được chú ý tới thôi. Trường như vậy ta gọi là khoá (key). Sắp xếp sẽ được tiến hành dựa vào giá trị của khoá này.
Ví dụ: Hồ sơ tuyển sinh của một trường Đại học là một danh sách thí sinh, mỗi thí sinh có tên, số báo danh, điểm thi. Khi muốn liệt kê danh sách những thí sinh trúng tuyển tức là phải sắp xếp các thí sinh theo thứ tự từ điểm cao nhất tới điểm thấp nhất. Ở đây khoá sắp xếp chính là điểm thi.
STT	SBD	Họ và tên	Điểm thi
1	A100	Nguyễn Văn A	20
2	B200	Trần Thị B	25
3	X150	Phạm Văn C	18
4	G180	Đỗ Thị D	21

Khi sắp xếp, các bản ghi trong bảng sẽ được đặt lại vào các vị trí sao cho giá trị khoá tương ứng với chúng có đúng thứ tự đã ấn định. Vì kích thước của toàn bản ghi có thể rất lớn, nên nếu việc sắp xếp thực hiện trực tiếp trên các bản ghi sẽ đòi hỏi sự chuyển đổi vị trí của các bản ghi, kéo theo việc thường xuyên phải di chuyển, copy những vùng nhớ lớn, gây ra những tổn phí thời gian khá nhiều. Thường người ta khắc phục tình trạng này bằng cách xây dựng một bảng khoá: Mỗi bản ghi trong bảng ban đầu sẽ tương ứng với một bản ghi trong bảng khoá. Bảng khoá cũng gồm các bản ghi nhưng mỗi bản ghi chỉ gồm có hai trường:
Trường thứ nhất chứa khoá
Trường thứ hai chứa liên kết tới một bản ghi trong bảng ban đầu, tức là chứa một thông tin đủ để biết bản ghi tương ứng với nó trong bảng ban đầu là bản ghi nào.
Sau đó, việc sắp xếp được thực hiện trực tiếp trên bảng khoá, trong quá trình sắp xếp, bảng chính không hề bị ảnh hưởng gì, việc truy cập vào một bản ghi nào đó của bảng chính vẫn có thể thực hiện được bằng cách dựa vào trường liên kết của bản ghi tương ứng thuộc bảng khoá.
Như ở ví dụ trên, ta có thể xây dựng bảng khoá gồm 2 trường, trường khoá chứa điểm và trường liên kết chứa số thứ tự của người có điểm tương ứng trong bảng ban đầu:
Điểm thi	STT
20	1
25	2
18	3
21	4

Sau khi sắp xếp theo trật tự điểm cao nhất tới điểm thấp nhất, bảng khoá sẽ trở thành:
Điểm thi	STT
25	2
20	1
21	4
18	3

Dựa vào bảng khoá, ta có thể biết được rằng người có điểm cao nhất là người mang số thứ tự 2, tiếp theo là người mang số thứ tự 4, tiếp nữa là người mang số thứ tự 1, và cuối cùng là người mang số thứ tự 3, còn muốn liệt kê danh sách đầy đủ thì ta chỉ việc đối chiếu với bảng ban đầu và liệt kê theo thứ tự 2, 4, 1, 3.
Có thể còn cải tiến tốt hơn dựa vào nhận xét sau: Trong bảng khoá, nội dung của trường khoá hoàn toàn có thể suy ra được từ trường liên kết bằng cách: Dựa vào trường liên kết, tìm tới bản ghi tương ứng trong bảng chính rồi truy xuất trường khoá trong bảng chính. Như ví dụ trên thì người mang số thứ tự 1 chắc chắn sẽ phải có điểm thi là 20, còn người mang số thứ tự 3 thì chắc chắn phải có điểm thi là 18. Vậy thì bảng khoá có thể loại bỏ đi trường khoá mà chỉ giữ lại trường liên kết. Trong trường hợp các phần tử trong bảng ban đầu được đánh số từ 1 tới n và trường liên kết chính là số thứ tự của bản ghi trong bảng ban đầu như ở ví dụ trên, người ta gọi kỹ thuật này là kỹ thuật sắp xếp bằng chỉ số: Bảng ban đầu không hề bị ảnh hưởng gì cả, việc sắp xếp chỉ đơn thuần là đánh lại chỉ số cho các bản ghi theo thứ tự sắp xếp. Cụ thể hơn:
Nếu r[1], r[2], …, r[n] là các bản ghi cần sắp xếp theo một thứ tự nhất định thì việc sắp xếp bằng chỉ số tức là xây dựng một dãy Index[1], Index[2], …, Index[n] mà ở đây:
Index[j] = Chỉ số của bản ghi sẽ đứng thứ j khi sắp thứ tự 
(Bản ghi r[index[j]] sẽ phải đứng sau j - 1 bản ghi khác khi sắp xếp)
Do khoá có vai trò đặc biệt như vậy nên sau này, khi trình bày các giải thuật, ta sẽ coi khoá như đại diện cho các bản ghi và để cho đơn giản, ta chỉ nói tới giá trị của khoá mà thôi. Các thao tác trong kỹ thuật sắp xếp lẽ ra là tác động lên toàn bản ghi giờ đây chỉ làm trên khoá.
 
Còn việc cài đặt các phương pháp sắp xếp trên danh sách các bản ghi và kỹ thuật sắp xếp bằng chỉ số, ta coi như bài tập.
Bài toán sắp xếp giờ đây có thể phát biểu như sau:
Xét quan hệ thứ tự toàn phần "nhỏ hơn hoặc bằng" ký hiệu "" trên một tập hợp S, là quan hệ hai ngôi thoả mãn bốn tính chất:
Với a, b, c  S
Tính phổ biến: Hoặc là a  b, hoặc b  a; 
Tính phản xạ: a  a
Tính phản đối xứng: Nếu a  b và b  a thì bắt buộc a = b. Tính bắc cầu: Nếu có a  b và b  c thì a  c.
Trong trường hợp a  b và a  b, ta dùng ký hiệu "<" cho gọn
Cho một dãy gồm n khoá. Giữa hai khoá bất kỳ có quan hệ thứ tự toàn phần "". Xếp lại dãy các khoá đó để được dãy khoá thoả mãn k1 k2  … kn.
Giả sử cấu trúc dữ liệu cho dãy khoá được mô tả như sau:
const
n = …; {Số khoá trong dãy khoá, có thể khai dưới dạng biến số nguyên để tuỳ biến hơn}
type
TKey = …; {Kiểu dữ liệu một khoá}
TArray = array[1..n] of TKey; var
k: TArray; {Dãy khoá}
Thì những thuật toán sắp xếp dưới đây được viết dưới dạng thủ tục sắp xếp dãy khoá k, kiểu chỉ số đánh cho từng khoá trong dãy có thể coi là số nguyên Integer.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.10', N'Thuật toán sắp xếp bằng cơ số (Radixsort)', N'..\..\public\data\C8\8_10.docx', 8, N'8.2. THUẬT TOÁN SẮP XẾP KIỂU CHỌN (SELECTIONSORT)
Một trong những thuật toán sắp xếp đơn giản nhất là phương pháp sắp xếp kiểu chọn. Ý tưởng cơ bản của cách sắp xếp này là:
Ở lượt thứ nhất, ta chọn trong dãy khoá k1, k2, …, kn ra khoá nhỏ nhất (khoá  mọi khoá khác) và đổi giá trị của nó với k1, khi đó giá trị khoá k1 trở thành giá trị khoá nhỏ nhất.
Ở lượt thứ hai, ta chọn trong dãy khoá k2, …, kn ra khoá nhỏ nhất và đổi giá trị của nó với k2.
…
Ở lượt thứ i, ta chọn trong dãy khoá ki, ki+1, …, kn ra khoá nhỏ nhất và đổi giá trị của nó với ki.
…
Làm tới lượt thứ n - 1, chọn trong hai khoá kn-1, kn ra khoá nhỏ nhất và đổi giá trị của nó với kn-1.
procedure SelectionSort; 
var
i, j, jmin: Integer; 
begin
for i := 1 to n - 1 do {Làm n - 1 lượt}
begin
{Chọn trong số các khoá từ ki tới kn ra khoá kjmin nhỏ nhất}
jmin := i;
for j := i + 1 to n do
if kj < kjmin then jmin := j; 
if jmin  i then
<Đảo giá trị của kjmin cho ki>
end; 
end;
Đối với phương pháp kiểu lựa chọn, ta có thể coi phép so sánh (kj < kjmin) là phép toán tích
cực để đánh giá hiệu suất thuật toán về mặt thời gian. Ở lượt thứ i, để chọn ra khoá nhỏ nhất bao giờ cũng cần n - i phép so sánh, số lượng phép so sánh này không hề phụ thuộc gì vào tình trạng ban đầu của dãy khoá cả. Từ đó suy ra tổng số phép so sánh sẽ phải thực hiện là:
(n - 1) + (n - 2) + … + 1 = n * (n - 1) / 2
Vậy thuật toán sắp xếp kiểu chọn có cấp là O(n2)
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.11', N'Thuật toán sắp xếp trộn (Mergesort)', N'..\..\public\data\C8\8_11.docx', 8, N'8.3. THUẬT TOÁN SẮP XẾP NỔI BỌT (BUBBLESORT)
Trong thuật toán sắp xếp nổi bọt, dãy các khoá sẽ được duyệt từ cuối dãy lên đầu dãy (từ kn  về k1), nếu gặp hai khoá kế cận bị ngược thứ tự thì đổi chỗ của chúng cho nhau. Sau lần duyệt như vậy, phần tử nhỏ nhất trong dãy khoá sẽ được chuyển về vị trí đầu tiên và vấn đề trở thành sắp xếp dãy khoá từ k2 tới kn:
procedure BubbleSort; 
var
i, j: Integer; 
begin
for i := 2 to n do
for j := n downto i do {Duyệt từ cuối dãy lên, làm nổi khoá nhỏ nhất trong số ki-1, …,kn về vị trí i-1}
if kj < kj-1 then
<Đảo giá trị kj và kj-1>
end;
Đối với thuật toán sắp xếp nổi bọt, ta có thể coi phép toán tích cực là phép so sánh kj < kj-1.
Và số lần thực hiện phép so sánh này là:
(n - 1) + (n - 2) + … + 1 = n * (n - 1) / 2
Vậy thuật toán sắp xếp nổi bọt cũng có cấp là O(n2). Bất kể tình trạng dữ liệu vào như thế nào.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.12', N'Cài đặt', N'..\..\public\data\C8\8_12.docx', 8, N'8.4. THUẬT TOÁN SẮP XẾP KIỂU CHÈN
Xét dãy khoá k1, k2, …, kn. Ta thấy dãy con chỉ gồm mỗi một khoá là k1 có thể coi là đã sắp xếp rồi. Xét thêm k2, ta so sánh nó với k1, nếu thấy k2 < k1 thì chèn nó vào trước k1. Đối với k3, ta lại xét dãy chỉ gồm 2 khoá k1, k2 đã sắp xếp và tìm cách chèn k3 vào dãy khoá đó để được thứ tự sắp xếp. Một cách tổng quát, ta sẽ sắp xếp dãy k1, k2, …, ki trong điều kiện dãy k1, k2, …, ki-1 đã sắp xếp rồi bằng cách chèn ki vào dãy đó tại vị trí đúng khi sắp xếp.
procedure InsertionSort; 
var
i, j: Integer;
tmp: TKey; {Biến giữ lại giá trị khoá chèn}
begin
for i := 2 to n do {Chèn giá trị ki vào dãy k1,…, ki-1 để toàn đoạn k1, k2,…, ki trở thành đã sắp xếp}
begin
tmp := ki; {Giữ lại giá trị ki}
j := i - 1;
while (j > 0) and (tmp < kj) do {So sánh giá trị cần chèn với lần lượt các khoá kj (i-1j0)}
begin
kj+1 := kj; {Đẩy lùi giá trị kj về phía sau một vị trí, tạo ra "khoảng trống" tại vị trí j}
j := j - 1;
end;
kj+1 := tmp; {Đưa giá trị chèn vào "khoảng trống" mới tạo ra}
end; 
end;
Đối với thuật toán sắp xếp kiểu chèn, thì chi phí thời gian thực hiện thuật toán phụ thuộc vào tình trạng dãy khoá ban đầu. Nếu coi phép toán tích cực ở đây là phép so sánh tmp < kj thì: Trường hợp tốt nhất ứng với dãy khoá đã sắp xếp rồi, mỗi lượt chỉ cần 1 phép so sánh, và như vậy tổng số phép so sánh được thực hiện là n - 1.
Trường hợp tồi tệ nhất ứng với dãy khoá đã có thứ tự ngược với thứ tự cần sắp thì ở lượt thứ i, cần có i - 1 phép so sánh và tổng số phép so sánh là:
(n - 1) + (n - 2) + … + 1 = n * (n - 1) / 2.
Trường hợp các giá trị khoá xuất hiện một cách ngẫu nhiên, ta có thể coi xác suất xuất hiện mỗi khoá là đồng khả năng, thì có thể coi ở lượt thứ i, thuật toán cần trung bình i / 2 phép so sánh và tổng số phép so sánh là:
(1 / 2) + (2 / 2) + … + (n / 2) = (n + 1) * n / 4.
Nhìn về kết quả đánh giá, ta có thể thấy rằng thuật toán sắp xếp kiểu chèn tỏ ra tốt hơn so với thuật toán sắp xếp chọn và sắp xếp nổi bọt. Tuy nhiên, chi phí thời gian thực hiện của thuật toán sắp xếp kiểu chèn vẫn còn khá lớn. Và xét trên phương diện tính toán lý thuyết thì cấp của thuật toán sắp xếp kiểu chèn vẫn là O(n2).
Có thể cải tiến thuật toán sắp xếp chèn nhờ nhận xét: Khi dãy khoá k1, k2, …, ki-1 đã được sắp xếp thì việc tìm vị trí chèn có thể làm bằng thuật toán tìm kiếm nhị phân và kỹ thuật chèn có thể làm bằng các lệnh dịch chuyển vùng nhớ cho nhanh. Tuy nhiên điều đó cũng không làm tốt hơn cấp độ phức tạp của thuật toán bởi trong trường hợp xấu nhất, ta phải mất n - 1 lần chèn và lần chèn thứ i ta phải dịch lùi i khoá để tạo ra khoảng trống trước khi đẩy giá trị khoá chèn vào chỗ trống đó.
procedure InsertionSortwithBinarySearching; 
var
i, inf, sup, median: Integer; 
tmp: TKey;
begin
for i := 2 to n do 
begin
tmp := ki; {Giữ lại giá trị ki}
inf := 1; sup := i - 1; {Tìm chỗ chèn giá trị tmp vào đoạn từ kinf tới ksup+1}
repeat {Sau mỗi vòng lặp này thì đoạn tìm bị co lại một nửa}
median := (inf + sup) div 2; {Xét chỉ số nằm giữa chỉ số inf và chỉ số sup}
if tmp < k[median] then sup := median - 1 
else inf := median + 1;
until inf > sup; {Kết thúc vòng lặp thì inf = sup + 1 chính là vị trí chèn}
<Dịch các phần tử từ kinf tới ki-1 lùi sau một vị trí>
kinf := tmp; {Đưa giá trị tmp vào "khoảng trống" mới tạo ra}
end; 
end;
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.13', N'Đánh giá, nhận xét', N'..\..\public\data\C8\8_13.docx', 8, N'8.5. SHELLSORT
Nhược điểm của thuật toán sắp xếp kiểu chèn thể hiện khi mà ta luôn phải chèn một khóa vào vị trí gần đầu dãy. Trong trường hợp đó, người ta sử dụng phương pháp ShellSort.
Xét dãy khoá: k1, k2, …, kn. Với một số nguyên dương h: 1  h  n, ta có thể chia dãy đó thành h dãy con:
Dãy con 1: k1, k1+h, k1 + 2h, … 
Dãy con 2: k2, k2+h, k2 + 2h, …
…
Dãy con h: kh, k2h, k3h, …

Ví dụ như dãy (4, 6, 7, 2, 3, 5, 1, 9, 8); n = 9; h = 3. Có 3 dãy con.
Dãy các khoá chính: 4  6  7  2  3  5  1  9  8
Dãy con 1:                4          2          1
Dãy con 2:                    6          3          9
Dãy con 3:                        7          5          8
Những dãy con như vậy được gọi là dãy con xếp theo độ dài bước h. Tư tưởng của thuật toán ShellSort là: Với một bước h, áp dụng thuật toán sắp xếp kiểu chèn từng dãy con độc lập để làm mịn dần dãy khoá chính. Rồi lại làm tương tự đối với bước h div 2 … cho tới khi h = 1 thì ta được dãy khoá sắp xếp.
Như ở ví dụ trên, nếu dùng thuật toán sắp xếp kiểu chèn thì khi gặp khoá k7 = 1, là khoá nhỏ nhất trong dãy khoá, nó phải chèn vào vị trí 1, tức là phải thao tác trên 6 khoá đứng trước nó. Nhưng nếu coi 1 là khoá của dãy con 1 thì nó chỉ cần chèn vào trước 2 khoá trong dãy con đó mà thôi. Đây chính là nguyên nhân ShellSort hiệu quả hơn sắp xếp chèn: Khoá nhỏ được nhanh chóng đưa về gần vị trí đúng của nó.
procedure ShellSort; 
var
i, j, h: Integer; 
tmp: TKey;
begin
h := n div 2;
while h <> 0 do {Làm mịn dãy với độ dài bước h}
begin
for i := h + 1 to n do
begin {Sắp xếp chèn trên dãy con ai-h, ai, ai+h, ai+2h, …}
tmp := ki; 
j := i - h;
while (j > 0) and (kj > tmp) do 
begin
kj+h := kj; 
j := j - h;
end;
kj+h := tmp; 
end;
h := h div 2; 
end;
end;
 


')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.14', N'Bài tập về sắp xếp', N'..\..\public\data\C8\EX.docx', 8, N'8.6. THUẬT TOÁN SẮP XẾP KIỂU PHÂN ĐOẠN (QUICKSORT)
8.6.1.	Tư tưởng của QuickSort
QuickSort là một phương pháp sắp xếp tốt nhất, nghĩa là dù dãy khoá thuộc kiểu dữ liệu có thứ tự nào, QuickSort cũng có thể sắp xếp được và không có một thuật toán sắp xếp nào nhanh hơn QuickSort về mặt tốc độ trung bình (theo tôi biết). Người sáng lập ra nó là C.A.R. Hoare đã mạnh dạn đặt tên cho nó là sắp xếp "NHANH".
Ý tưởng chủ đạo của phương pháp có thể tóm tắt như sau: Sắp xếp dãy khoá k1, k2, …, kn thì có thể coi là sắp xếp đoạn từ chỉ số 1 tới chỉ số n trong dãy khoá đó. Để sắp xếp một đoạn trong dãy khoá, nếu đoạn đó có  1 phần tử thì không cần phải làm gì cả, còn nếu đoạn đó có ít nhất 2 phần tử, ta chọn một khoá ngẫu nhiên nào đó của đoạn làm "chốt" (pivot). Mọi khoá nhỏ hơn khoá chốt được xếp vào vị trí đứng trước chốt, mọi khoá lớn hơn khoá chốt được xếp vào vị trí đứng sau chốt. Sau phép hoán chuyển như vậy thì đoạn đang xét được chia làm hai đoạn khác rỗng mà mọi khoá trong đoạn đầu đều  chốt và mọi khoá trong đoạn sau đều  chốt. Hay nói cách khác: Mỗi khoá trong đoạn đầu đều  mọi khoá trong đoạn sau. Và vấn đề trở thành sắp xếp hai đoạn mới tạo ra (có độ dài ngắn hơn đoạn ban đầu) bằng phương pháp tương tự.
procedure QuickSort;

procedure Partition(L, H: Integer); {Sắp xếp đoạn từ kL, kL+1, …, kH}
var
i, j: Integer;
Pivot: TKey; {Biến lưu giá trị khoá chốt}
begin
if L  H then Exit; {Nếu đoạn chỉ có  1 phần tử thì không phải làm gì cả} 
Pivot := kRandom(H-L+1)+L; {Chọn một khoá ngẫu nhiên trong đoạn làm khoá chốt} i := L; 
j := H; {i := vị trí đầu đoạn; j := vị trí cuối đoạn}
repeat
while ki < Pivot do i := i + 1; {Tìm từ đầu đoạn khoá  khoá chốt}
while kj > Pivot do j := j - 1; {Tìm từ cuối đoạn khoá  khoá chốt}
{Đến đây ta tìm được hai khoá ki và kj mà ki  key  kj}
if i  j then 
begin
if i < j then {Nếu chỉ số i đứng trước chỉ số j thì đảo giá trị hai khoá ki và kj}
<Đảo giá trị ki và kj> {Sau phép đảo này ta có: ki  key  kj }
i := i + 1; 
j := j - 1;
end; 
until i > j;
Partition(L, j); 
Partition(i, H); {Sắp xếp hai đoạn con mới tạo ra}
end;

begin
Partition(1, n); 
end;
Ta  thử  phân  tích  xem  tại  sao  đoạn  chương  trình  trên  hoạt  động  đúng:  Xét  vòng  lặp repeat…until trong lần lặp đầu tiên, vòng lặp while thứ nhất chắc chắn sẽ tìm được khoá ki khoá chốt bởi chắc chắn tồn tại trong đoạn một khoá bằng khóa chốt. Tương tự như vậy, vòng lặp while thứ hai chắc chắn tìm được khoá kj  khoá chốt. Nếu như khoá ki đứng trước khoá kj thì ta đảo giá trị hai khoá, cho i tiến và j lùi. Khi đó ta có nhận xét rằng mọi khoá đứng trước vị trí i sẽ phải  khoá chốt và mọi khoá đứng sau vị trí j sẽ phải  khoá chốt.
 
Vòng lặp trong của QuickSort
Điều này đảm bảo cho vòng lặp repeat…until tại bước sau, hai vòng lặp while…do bên trong chắc chắn lại tìm được hai khoá ki và kj mà ki  khoá chốt  kj, nếu khoá ki đứng trước khoá kj thì lại đảo giá trị của chúng, cho i tiến về cuối một bước và j lùi về đầu một bước. Vậy thì quá trình hoán chuyển phần tử trong vòng lặp repeat…until sẽ đảm bảo tại mỗi bước:
•	Hai vòng lặp while…do bên trong luôn tìm được hai khoá ki, kj mà ki  khoá chốt  kj. Không có trường hợp hai chỉ số i, j chạy ra ngoài đoạn (luôn luôn có L  i, j  H).
•	Sau mỗi phép hoán chuyển, mọi khoá đứng trước vị trí i luôn  khoá chốt và mọi khoá đứng sau vị trí j luôn  khoá chốt.
Vòng lặp repeat …until sẽ kết thúc khi mà chỉ số i đứng phía sau chỉ số j.
 
Trạng thái trước khi gọi đệ quy
Theo những nhận xét trên, nếu có một khoá nằm giữa kj và ki thì khoá đó phải đúng bằng khoá chốt và nó đã được đặt ở vị trí đúng của nó, nên có thể bỏ qua khoá này mà chỉ xét hai đoạn ở hai đầu. Công việc còn lại là gọi đệ quy để làm tiếp với đoạn từ kL tới kj và đoạn từ ki tới kH. Hai đoạn này ngắn hơn đoạn đang xét bởi vì L  j < i  H. Vậy thuật toán không bao giờ bị rơi vào quá trình vô hạn mà sẽ dừng và cho kết quả đúng đắn.
Xét về độ phức tạp tính toán:
Trường hợp tồi tệ nhất, là khi chọn khoá chốt, ta chọn phải khoá nhỏ nhất hay lớn nhất trong đoạn, khi đó phép phân đoạn sẽ chia thành một đoạn gồm n - 1 phần tử và đoạn còn lại chỉ có  1 phần tử. Có thể chứng minh trong trường hợp này, thời gian thực hiện giải thuật T(n) = O(n2) Trường hợp tốt nhất, phép phân đoạn tại mỗi bước sẽ chia được thành hai đoạn bằng nhau.  Tức là khi chọn khoá chốt, ta chọn đúng trung vị của dãy khoá. Có thể chứng minh trong trường hợp này, thời gian thực hiện giải thuật T(n) = O(nlog2n)
Trường hợp các khoá được phân bố ngẫu nhiên, thì trung bình thời gian thực hiện giải thuật cũng là T(n) = O(nlog2n).
Việc tính toán chi tiết, đặc biệt là khi xác định T(n) trung bình, phải dùng các công cụ toán phức tạp, ta chỉ công nhận những kết quả trên.
8.6.2.	Vài cải tiến của QuickSort
Việc chọn chốt cho phép phân đoạn quyết định hiệu quả của QuickSort, nếu chọn chốt không tốt, rất có thể việc phân đoạn bị suy biến thành trường hợp xấu khiến QuickSort hoạt động chậm và tràn ngăn xếp chương trình con khi gặp phải dây chuyền đệ qui quá dài. Một cải tiến sau có thể khắc phục được hiện tượng tràn ngăn xếp nhưng cũng hết sức chậm trong trường hợp xấu, kỹ thuật này khi đã phân được [L, H] được hai đoạn con [L, j] và [i, H] thì chỉ gọi đệ quy để tiếp tục đối với đoạn ngắn, và lặp lại quá trình phân đoạn đối với đoạn dài.
procedure QuickSort;

procedure Partition(L, H: Integer); {Sắp xếp đoạn từ kL, kL+1, …, kH}
var
i, j: Integer; 
begin
repeat
if L  H then Exit;
<Phân đoạn [L, H] được hai đoạn con [L, j] và [i, H]> 
if <đoạn [L, j] ngắn hơn đoạn [i, H]> then
begin
Partition(L, j); 
L := i; 
end
else
begin
Partition(i, H); 
H := j; 
end;
until False; 
end;

begin
Partition(1, n); 
end;
Cải tiến thứ hai đối với QuickSort là quá trình phân đoạn nên chỉ làm đến một mức nào đó, đến khi đoạn đang xét có độ dài  M (M là một số nguyên tự chọn nằm trong khoảng từ 9 tới 25) thì không phân đoạn tiếp mà nên áp dụng thuật toán sắp xếp kiểu chèn.
Cải tiến thứ ba của QuickSort là: Nên lấy trung vị của một dãy con trong đoạn để làm chốt, (trung vị của một dãy n phần tử là phần tử đứng thứ n / 2 khi sắp thứ tự). Cách chọn được đánh giá cao nhất là chọn trung vị của ba phần tử đầu, giữa và cuối đoạn.
Cuối cùng, ta có nhận xét: QuickSort là một công cụ sắp xếp mạnh, chỉ có điều khó chịu gặp phải là trường hợp suy biến của QuickSort (quá trình phân đoạn chia thành một dãy rất ngắn và một dãy rất dài). Và điều này trên phương diện lý thuyết là không thể khắc phục được: Ví dụ với n = 10000.
Nếu như chọn chốt là khoá đầu đoạn (Thay dòng chọn khoá chốt bằng Pivot := kL) hay chọn chốt là khoá cuối đoạn (Thay bằng Pivot := kH) thì với dãy sau, chương trình hoạt động rất chậm:
(1, 2, 3, 4, 5, …, 9999, 10000)
Nếu như chọn chốt là khoá giữa đoạn (Thay dòng chọn khoá chốt bằng Pivot := k(L+H) div 2) thì với dãy sau, chương trình cũng rất chậm:
(1, 2, …, 4999, 5000, 5000, 4999, …, 2, 1)
Trong trường hợp chọn chốt là trung vị dãy con hay chọn chốt ngẫu nhiên, thật khó có thể tìm ra một bộ dữ liệu khiến cho QuickSort hoạt động chậm. Nhưng ta cũng cần hiểu rằng với mọi chiến lược chọn chốt, trong 10000! dãy hoán vị của dãy (1, 2, … 10000) thế nào cũng có một dãy làm QuickSort bị suy biến, tuy nhiên trong trường hợp chọn chốt ngẫu nhiên, xác suất xảy ra dãy này quá nhỏ tới mức ta không cần phải tính đến, như vậy khi đã chọn chốt ngẫu nhiên thì ta không cần phải quan tâm tới ngăn xếp đệ quy, không cần quan tâm tới kỹ thuật khử đệ quy và vấn đề suy biến của QuickSort.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.2', N'Thuật toán sắp xếp kiểu chọn (Selectionsort)', N'..\..\public\data\C8\8_2.docx', 8, N'8.7. THUẬT TOÁN SẮP XẾP KIỂU VUN ĐỐNG (HEAPSORT)
8.7.1.	Đống (heap)
Đống là một dạng cây nhị phân hoàn chỉnh đặc biệt mà giá trị lưu tại mọi nút nhánh đều lớn hơn hay bằng giá trị lưu trong hai nút con của nó.
 
 
Heap
8.7.2.	Vun đống
Trong bài học về cây, ta đã biết một dãy khoá k1, k2, …, kn là biểu diễn của một cây nhị phân hoàn chỉnh mà ki là giá trị lưu trong nút thứ i, nút con của nút thứ i là nút 2i và nút 2i + 1, nút cha của nút thứ j là nút j div 2. Vấn đề đặt ra là sắp lại dãy khoá đã cho để nó biểu diễn một đống.
Vì cây nhị phân chỉ gồm có một nút hiển nhiên là đống, nên để vun một nhánh cây gốc r thành đống, ta có thể coi hai nhánh con của nó (nhánh gốc 2r và 2r + 1) đã là đống rồi và thực hiện thuật toán vun đống từ dưới lên (bottom-up) đối với cây: Gọi h là chiều cao của cây, nút ở mức h (nút lá) đã là gốc một đống, ta vun lên để những nút ở mức h - 1 cũng là gốc của đống, … cứ như vậy cho tới nút ở mức 1 (nút gốc) cũng là gốc của đống.
Thuật toán vun thành đống đối với cây gốc r, hai nhánh con của r đã là đống rồi:
Giả sử ở nút r chứa giá trị V. Từ r, ta cứ đi tới nút con chứa giá trị lớn nhất trong 2 nút con, cho tới khi gặp phải một nút c mà mọi nút con của c đều chứa giá trị  V (nút lá cũng là trường hợp riêng của điều kiện này). Dọc trên đường đi từ r tới c, ta đẩy giá trị chứa ở nút con lên nút cha và đặt giá trị V vào nút c.
 
Vun đống
8.7.3.	Tư tưởng của HeapSort
Đầu tiên, dãy khoá k1, k2, …, kn được vun từ dưới lên để nó biểu diễn một đống, khi đó khoá k1 tương ứng với nút gốc của đống là khoá lớn nhất, ta đảo giá trị khoá đó cho kn và không tính tới kn nữa. Còn lại dãy khoá k1, k2, …, kn-1 tuy không còn là biểu diễn của một đống nữa nhưng nó lại biểu diễn cây nhị phân hoàn chỉnh mà hai nhánh cây ở nút thứ 2 và nút thứ 3 (hai nút con của nút 1) đã là đống rồi. Vậy chỉ cần vun một lần, ta lại được một đống, đảo giá trị k1 cho kn-1 và tiếp tục cho tới khi đống chỉ còn lại 1 nút.
Ví dụ:
 
Đảo giá trị k1 cho kn và xét phần còn lại
 
Vun phần còn lại thành đống rồi lại đảo trị k1 cho kn-1
Thuật toán HeapSort có hai thủ tục chính:
Thủ tục Adjust(root, endnode) vun cây gốc root thành đống trong điều kiện hai cây gốc 2.root và 2.root +1 đã là đống rồi. Các nút từ endnode + 1 tới n đã nằm ở vị trí đúng và không được tính tới nữa.
Thủ tục HeapSort mô tả lại quá trình vun đống và chọn phần tử theo ý tưởng trên:
procedure HeapSort; 
var
r, i: Integer;

procedure Adjust(root, endnode: Integer); {Vun cây gốc Root thành đống}
var
c: Integer;
Key: TKey; {Biến lưu giá trị khoá ở nút Root}
begin
Key := kroot;
while root * 2  endnode do {Chừng nào root chưa phải là lá}
begin
c := Root * 2; {Xét nút con trái của Root, so sánh với giá trị nút con phải, chọn ra nút mang giá trị lớn nhất}
if (c < endnode) and (kc < kc+1) then c := c + 1;
if kc  Key then Break; {Cả hai nút con của Root đều mang giá trị  Key thì dừng ngay}
kroot := kc; root := c; {Chuyển giá trị từ nút con c lên nút cha root và đi xuống xét nút con c}
end;
kroot := Key; {Đặt giá trị Key vào nút root}
end;

begin {Bắt đầu thuật toán HeapSort}
for r := n div 2 downto 1 do Adjust(r, n); {Vun cây từ dưới lên tạo thành đống}
for i := n downto 2 do 
begin
<Đảo giá trị k1 và ki> {Khoá lớn nhất được chuyển ra cuối dãy}
Adjust(1, i - 1); {Vun phần còn lại thành đống}
end; 
end;
Về độ phức tạp của thuật toán, ta đã biết rằng cây nhị phân hoàn chỉnh có n nút thì chiều cao của nó không quá [log2(n + 1)] + 1. Cứ cho là trong trường hợp xấu nhất thủ tục Adjust phải thực hiện tìm đường đi từ nút gốc tới nút lá ở xa nhất thì đường đi tìm được cũng chỉ dài bằng chiều cao của cây và độ phức tạp của một lần gọi Adjust là O(log2n). Từ đó có thể suy ra, trong trường hợp xấu nhất, độ phức tạp của HeapSort cũng chỉ là O(nlog2n). Việc đánh giá thời gian thực hiện trung bình phức tạp hơn, ta chỉ ghi nhận một kết quả đã chứng minh được là độ phức tạp trung bình của HeapSort cũng là O(nlog2n).
Có thể nhận xét thêm là QuickSort đệ quy cần thêm không gian nhớ cho Stack, còn HeapSort ngoài một nút nhớ phụ để thực hiện việc đổi chỗ, nó không cần dùng thêm gì khác. HeapSort tốt hơn QuickSort về phương diện lý thuyết bởi không có trường hợp tồi tệ nào HeapSort có thể mắc phải. Cũng nhờ có HeapSort mà giờ đây khi giải mọi bài toán có chứa mô-đun sắp xếp, ta có thể nói rằng độ phức tạp của thủ tục sắp xếp đó không quá O(nlog2n).
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.3', N'Thuật toán sắp xếp nổi bọt (Bubblesort)', N'..\..\public\data\C8\8_3.docx', 8, N'8.8. SẮP XẾP BẰNG PHÉP ĐẾM PHÂN PHỐI (DISTRIBUTION COUNTING)
Có một thuật toán sắp xếp đơn giản cho trường hợp đặc biệt: Dãy khoá k1, k2, …, kn là các số nguyên nằm trong khoảng từ 0 tới M (TKey = 0..M).
Ta dựng dãy c0, c1, …, cM các biến đếm, ở đây cV là số lần xuất hiện giá trị V trong dãy khoá:
for V := 0 to M do cV := 0; {Khởi tạo dãy biến đếm}
for i := 1 to n do cki := cki + 1;
Ví dụ với dãy khoá: 1, 2, 2, 3, 0, 0, 1, 1, 3, 3 (n = 10, M = 3), sau bước đếm ta có:
c0 = 2; c1 = 3; c2 = 2; c3 = 3.
Dựa vào dãy biến đếm, ta hoàn toàn có thể biết được: sau khi sắp xếp thì giá trị V phải nằm từ vị trí nào tới vị trí nào. Như ví dụ trên thì giá trị 0 phải nằm từ vị trí 1 tới vị trí 2; giá trị 1 phải đứng liên tiếp từ vị trí 3 tới vị trí 5; giá trị 2 đứng ở vị trí 6 và 7 còn giá trị 3 nằm ở ba vị trí cuối 8, 9, 10:
0 0 1 1 1 2 2 3 3 3
Tức là sau khi sắp xếp:
Giá trị 0 đứng trong đoạn từ vị trí 1 tới vị trí c0.
Giá trị 1 đứng trong đoạn từ vị trí c0 + 1 tới vị trí c0 + c1.
Giá trị 2 đứng trong đoạn từ vị trí c0 + c1 + 1 tới vị trí c0 + c1 + c2.
…
Giá trị v trong đoạn đứng từ vị trí c0 + c1 + … + cv-1 + 1 tới vị trí c0 + c1 + c2 + … + cv.
…
Để ý vị trí cuối của mỗi đoạn, nếu ta tính lại dãy c như sau:
for V := 1 to M do cV := cV-1 + cV
Thì cV là vị trí cuối của đoạn chứa giá trị V trong dãy khoá đã sắp xếp.
Muốn dựng lại dãy khoá sắp xếp, ta thêm một dãy khoá phụ x1, x2, …, xn. Sau đó duyệt lại dãy khoá k, mỗi khi gặp khoá mang giá trị V ta đưa giá trị đó vào khoá xcv và giảm cv đi 1.
for i := n downto 1 do 
begin
V := ki;
XcV := ki; cV := cV - 1;
end;
 
Khi đó dãy khoá x chính là dãy khoá đã được sắp xếp, công việc cuối cùng là gán giá trị dãy khoá x cho dãy khoá k.
procedure DistributionCounting; {TKey = 0..M}
var
c: array[0..M] of Integer; {Dãy biến đếm số lần xuất hiện mỗi giá trị}
x: TArray; {Dãy khoá phụ}
i: Integer;
V: TKey;
begin
for V := 0 to M do cV := 0; {Khởi tạo dãy biến đếm}
for i := 1 to n do cki := cki + 1; {Đếm số lần xuất hiện các giá trị}
for V := 1 to M do cV := cV-1 + cV; {Tính vị trí cuối mỗi đoạn}
for i := n downto 1 do 
begin
V := ki;
xcV := ki; cV := cV - 1; 
end;
k := x; {Sao chép giá trị từ dãy khoá x sang dãy khoá k}
end;
Rõ ràng độ phức tạp của phép đếm phân phối là O(max(M, n)). Nhược điểm của phép đếm phân phối là khi M quá lớn thì cho dù n nhỏ cũng không thể làm được.
Có thể có thắc mắc tại sao trong thao tác dựng dãy khoá x, phép duyệt dãy khoá k theo thứ tự nào thì kết quả sắp xếp cũng như vậy, vậy tại sao ta lại chọn phép duyệt ngược từ dưới lên?. Để trả lời câu hỏi này, ta phải phân tích thêm một đặc trưng của các thuật toán sắp xếp
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.4', N'Thuật toán sắp xếp kiểu chèn', N'..\..\public\data\C8\8_4.docx', 8, N'8.9. TÍNH ỔN ĐỊNH CỦA THUẬT TOÁN SẮP XẾP (STABILITY)
Một phương pháp sắp xếp được gọi là ổn định nếu nó bảo toàn thứ tự ban đầu của các bản  ghi mang khoá bằng nhau trong danh sách. Ví dụ như ban đầu danh sách sinh viên được xếp theo thứ tự tên alphabet, thì khi sắp xếp danh sách sinh viên theo thứ tự giảm dần của điểm thi, những sinh viên bằng điểm nhau sẽ được dồn về một đoạn trong danh sách và vẫn được giữ nguyên thứ tự tên alphabet.
Hãy xem lại nhưng thuật toán sắp xếp ở trước, trong những thuật toán đó, thuật toán sắp xếp nổi bọt, thuật toán sắp xếp chèn và phép đếm phân phối là những thuật toán sắp xếp ổn định, còn những thuật toán sắp xếp khác (và nói chung những thuật toán sắp xếp đòi hỏi phải đảo giá trị 2 bản ghi ở vị trí bất kỳ) là không ổn định.
Với phép đếm phân phối ở mục trước, ta nhận xét rằng nếu hai bản ghi có khoá sắp xếp bằng nhau thì khi đưa giá trị vào dãy bản ghi phụ, bản ghi nào vào trước sẽ nằm phía sau. Vậy nên ta sẽ đẩy giá trị các bản ghi vào dãy phụ theo thứ tự ngược để giữ được thứ tự tương đối ban đầu.
Nói chung, mọi phương pháp sắp xếp tổng quát cho dù không ổn định thì đều có thể biến đổi để nó trở thành ổn định, phương pháp chung nhất được thể hiện qua ví dụ sau:
Giả sử ta cần sắp xếp các sinh viên trong danh sách theo thứ tự giảm dần của điểm bằng một thuật toán sắp xếp ổn định. Ta thêm cho mỗi sinh viên một khoá Index là thứ tự ban đầu của anh ta trong danh sách. Trong thuật toán sắp xếp được áp dụng, cứ chỗ nào cần so sánh hai sinh viên A và B xem anh nào phải đứng trước, trước hết ta quan tâm tới điểm số: Nếu điểm của A khác điểm của B thì anh nào điểm cao hơn sẽ đứng trước, nếu điểm số bằng nhau thì anh nào có Index nhỏ hơn sẽ đứng trước.
Trong một số bài toán, tính ổn định của thuật toán sắp xếp quyết định tới cả tính đúng đắn của toàn thuật toán lớn. Chính tính "nhanh" của QuickSort và tính ổn định của phép đếm phân phối là cơ sở nền tảng cho hai thuật toán sắp xếp cực nhanh trên các dãy khoá số mà ta sẽ trình bày dưới đây.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.5', N'Shellsort', N'..\..\public\data\C8\8_5.docx', 8, N'8.10.	THUẬT TOÁN SẮP XẾP BẰNG CƠ SỐ (RADIXSORT)
Bài toán đặt ra là: Cho dãy khoá là các số tự nhiên k1, k2, …, kn hãy sắp xếp chúng theo thứ tự không giảm. (Trong trường hợp ta đang xét, TKey là kiểu số tự nhiên)
8.10.1.	Sắp xếp cơ số theo kiểu hoán vị các khoá (Exchange RadixSort)
Hãy xem lại thuật toán QuickSort, tại bước phân đoạn nó phân đoạn đang xét thành hai đoạn thoả mãn mỗi khoá trong đoạn đầu  mọi khoá trong đoạn sau và thực hiện tương tự trên hai đoạn mới tạo ra, việc phân đoạn được tiến hành với sự so sánh các khoá với giá trị một khoá chốt.
Đối với các số nguyên thì ta có thể coi mỗi số nguyên là một dãy z bit đánh số từ bit 0 (bit ở hàng đơn vị) tới bit z - 1 (bit cao nhất). Ví dụ:
 
Đánh số các bit
Vậy thì tại bước phân đoạn dãy khoá từ k1 tới kn, ta có thể đưa những khoá có bit cao nhất là 0 về đầu dãy, những khoá có bit cao nhất là 1 về cuối dãy. Dễ thấy rằng những khoá bắt đầu bằng bit 0 sẽ phải nhỏ hơn những khoá bắt đầu bằng bit 1. Tiếp tục quá trình phân đoạn với hai đoạn dãy khoá: Đoạn gồm các khoá có bit cao nhất là 0 và đoạn gồm các khoá có bit cao nhất là 1. Với những khoá thuộc cùng một đoạn thì có bit cao nhất giống nhau, nên ta có thể áp dụng quá trình phân đoạn tương tự trên theo bit thứ z - 2 và cứ tiếp tục như vậy …
Quá trình phân đoạn kết thúc nếu như đoạn đang xét là rỗng hay ta đã tiến hành phân đoạn đến tận bit đơn vị, tức là tất cả các khoá thuộc một trong hai đoạn mới tạo ra đều có bit đơn vị bằng nhau (điều này đồng nghĩa với sự bằng nhau ở tất cả những bit khác, tức là bằng nhau về giá trị khoá).
Ví dụ:
Xét dãy khoá: 1, 3, 7, 6, 5, 2, 3, 4, 4, 5, 6, 7. Tương ứng với các dãy 3 bit:
 
Trước hết ta chia đoạn dựa vào bit 2 (bit cao nhất):
 
Sau đó chia tiếp hai đoạn tạo ra dựa vào bit 1:
 
Cuối cùng, chia tiếp những đoạn tạo ra dựa vào bit 0:
 
Ta được dãy khoá tương ứng: 1, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7 là dãy khoá sắp xếp.
Quá trình chia đoạn dựa vào bit b có thể chia thành một đoạn rỗng và một đoạn gồm toàn bộ các phần tử còn lại, nhưng việc chia đoạn không bao giờ bị rơi vào quá trình đệ quy vô hạn bởi những lần đệ quy tiếp theo sẽ phân đoạn dựa vào bit b - 1, b - 2 …và nếu xét đến bit 0 sẽ phải dừng lại. Công việc còn lại là cố gắng hiểu đoạn chương trình sau và phân tích xem tại sao nó hoạt động đúng:
procedure ExchangeRadixSort; 
var
z: Integer; {Độ dài dãy bit biểu diễn mỗi khoá}

procedure Partition(L, H, b: Integer); {Phân đoạn [L, H] dựa vào bit b}
var
i, j: Integer; 
begin
if L  H then Exit; 
i := L; 
j := H;
repeat
{Hai vòng lặp trong dưới đây luôn cầm canh i < j}
while (i < j) and (Bit b của ki = 0) do i := i + 1; {Tìm khoá có bit b = 1 từ đầu đoạn}
while (i < j) and (Bit b của kj = 1) do j := j - 1; {Tìm khoá có bit b = 0 từ cuối đoạn}
<Đảo giá trị ki cho kj>; until i = j;
if <Bit b của kj = 0> then j := j + 1; {j là điểm bắt đầu của đoạn có bit b là 1}
if b > 0 then {Chưa xét tới bit đơn vị}
begin
Partition(L, j - 1, b - 1); 
Partition(j, R, b - 1); end;
end;

begin
<Dựa vào giá trị lớn nhất của dãy khoá, xác định z là độ dài dãy bit biểu diễn mỗi khoá> 
Partition(1, n, z - 1);
end;
Với RadixSort, ta hoàn toàn có thể làm trên hệ cơ số R khác chứ không nhất thiết phải làm
trên hệ nhị phân (ý tưởng cũng tương tự như trên), tuy nhiên quá trình phân đoạn sẽ không phải chia làm 2 mà chia thành R đoạn. Về độ phức tạp của thuật toán, ta thấy để phân đoạn bằng một bit thì thời gian sẽ là C.n để chia tất cả các đoạn cần chia bằng bit đó (C là hằng số). Vậy tổng thời gian phân đoạn bằng z bit sẽ là C.n.z. Trong trường hợp xấu nhất, độ phức tạp của RadixSort là O(n.z). Và độ phức tạp trung bình của RadixSort là O(n.min(z, log2n)).
Nói chung, RadixSort cài đặt như trên chỉ thể hiện tốc độ tối đa trên các hệ thống cho phép xử lý trực tiếp trên các bit: Hệ thống phải cho phép lấy một bit ra dễ dàng và thao tác với thời gian nhanh hơn hẳn so với thao tác trên Byte và Word. Khi đó RadixSort sẽ tốt hơn nhiều QuickSort. (Ta thử lập trình sắp xếp các dãy nhị phân độ dài z theo thứ tự từ điển để khảo sát). Trên các máy tính hiện nay chỉ cho phép xử lý trực tiếp trên Byte (hay Word, DWord v.v…), việc tách một bit ra khỏi Byte đó để xử lý lại rất chậm và làm ảnh hưởng không nhỏ tới tốc độ của RadixSort. Chính vì vậy, tuy đây là một phương pháp hay, nhưng khi cài đặt cụ thể thì tốc độ cũng chỉ ngang ngửa chứ không thể qua mặt QuickSort được.
8.10.2.	Sắp xếp cơ số trực tiếp (Straight RadixSort)
Ta sẽ trình bày phương pháp sắp xếp cơ số trực tiếp bằng một ví dụ: Sắp xếp dãy khoá:
  
Trước hết, ta sắp xếp dãy khoá này theo thứ tự tăng dần của chữ số hàng đơn vị bằng một thuật toán sắp xếp khác, được dãy khoá:
  
Sau đó, ta sắp xếp dãy khoá mới tạo thành theo thứ tự tăng dần của chữ số hàng chục bằng một thuật toán sắp xếp ổn định, được dãy khoá:
  
Vì thuật toán sắp xếp ta sử dụng là ổn định, nên nếu hai khoá có chữ số hàng chục giống nhau thì khoá nào có chữ số hàng đơn vị nhỏ hơn sẽ đứng trước. Nói như vậy có nghĩa là dãy khoá thu được sẽ có thứ tự tăng dần về giá trị tạo thành từ hai chữ số cuối.
Cuối cùng, ta sắp xếp lại dãy khoá theo thứ tự tăng dần của chữ số hàng trăm cũng bằng một thuật toán sắp xếp ổn định, thu được dãy khoá:
  
Lập luận tương tự như trên dựa vào tính ổn định của phép sắp xếp, dãy khoá thu được sẽ có thứ tự tăng dần về giá trị tạo thành bởi cả ba chữ số, đó là dãy khoá đã sắp.
Nhận xét:
Ta hoàn toàn có thể coi số chữ số của mỗi khoá là bằng nhau, như ví dụ trên nếu có số 15 trong dãy khoá thì ta có thể coi nó là 015.
Cũng từ ví dụ, ta có thể thấy rằng số lượt thao tác sắp xếp phải áp dụng đúng bằng số chữ số tạo thành một khoá. Với một hệ cơ số lớn, biểu diễn một giá trị khoá sẽ phải dùng ít chữ số hơn. Ví dụ số 12345 trong hệ thập phân phải dùng tới 5 chữ số, còn trong hệ cơ số 1000 chỉ cần dùng 2 chữ số AB mà thôi, ở đây A là chữ số mang giá trị 12 còn B là chữ số mang giá trị 345.
Tốc độ của sắp xếp cơ số trực tiếp phụ thuộc rất nhiều vào thuật toán sắp xếp ổn định tại mỗi bước. Không có một lựa chọn nào khác tốt hơn phép đếm phân phối. Tuy nhiên, phép đếm phân phối có thể không cài đặt được hoặc kém hiệu quả nếu như tập giá trị khoá quá rộng, không cho phép dựng ra dãy các biến đếm hoặc phải sử dụng dãy biến đếm quá dài (Điều này xảy ra nếu chọn hệ cơ số quá lớn).
Một lựa chọn khôn ngoan là nên chọn hệ cơ số thích hợp cho từng trường hợp cụ thể để dung hoà tới mức tối ưu nhất ba mục tiêu:
Việc lấy ra một chữ số của một số được thực hiện dễ dàng. 
Sử dụng ít lần gọi phép đếm phân phối.
Phép đếm phân phối thực hiện nhanh
 

procedure StraightRadixSort; 
const
radix = …; {Tuỳ chọn hệ cơ số radix cho hợp lý}
var
t: TArray; {Dãy khoá phụ}
p: Integer;
nDigit: Integer; {Số chữ số cho một khoá, đánh số từ chữ số thứ 0 là hàng đơn vị đến chữ số thứ nDigit - 1}
Flag: Boolean; {Flag = True thì sắp dãy k, ghi kết quả vào dãy t; Flag = False thì sắp dãy t, ghi kq vào k}

function GetDigit(Num: TKey; p: Integer): Integer; {Lấy chữ số thứ p của số Num (0p<nDigit)}
begin
GetDigit := Num div radixp mod radix; {Trường hợp cụ thể có thể có cách viết tốt hơn}
end;

{Sắp xếp ổn định dãy số x theo thứ tự tăng dần của chữ số thứ p, kết quả sắp xếp được chứa vào dãy số y}
procedure DCount(var x, y: TArray; p: Integer); {Thuật toán đếm phân phối, sắp từ x sang y}
var
c: array[0..radix - 1] of Integer; {cd là số lần xuất hiện chữ số d tại vị trí p}
i, d: Integer; 
begin
for d := 0 to radix - 1 do cd := 0; 
for i := 1 to n do
begin
d := GetDigit(xi, p); 
cd := cd + 1; 
end;
for d := 1 to radix - 1 do cd := cd-1 + cd; {các cd trở thành các mốc cuối đoạn}
for i := n downto 1 do {Điền giá trị vào dãy y}
begin
d := GetDigit(xi, p); 
ycd := xi; 
cd := cd - 1;
end;
end;

begin {Thuật toán sắp xếp cơ số trực tiếp}
<Dựa vào giá trị lớn nhất trong dãy khoá, xác định nDigit là số chữ số phải dùng cho mỗi khoá trong hệ radix>; 
Flag := True;
for p := 0 to nDigit - 1 do {Xét từ chữ số hàng đơn vị lên, sắp xếp ổn định theo chữ số thứ p}
begin
if Flag then DCount(k, t, p) 
else DCount(t, k, p);
Flag := not Flag; {Đảo cờ, dùng k tính t rồi lại dùng t tính k …}
end;
if not Flag then k := t; {Nếu kết quả cuối cùng đang ở trong t thì sao chép giá trị từ t sang k}
end;
Xét phép đếm phân phối, ta đã biết độ phức tạp của nó là O(max(radix, n)). Mà radix là một hằng số tự ta chọn từ trước, nên khi n lớn, độ phức tạp của phép đếm phân phối là O(n). Thuật toán sử dụng nDigit lần phép đếm phân phối nên có thể thấy độ phức tạp của thuật toán là O(n.nDigit) bất kể dữ liệu đầu vào.
Ta có thể coi sắp xếp cơ số trực tiếp là một mở rộng của phép đếm phân phối, khi dãy số chỉ toàn các số có 1 chữ số (trong hệ radix) thì đó chính là phép đếm phân phối. Sự khác biệt ở đây là: Sắp xếp cơ số trực tiếp có thể thực hiện với các khoá mang giá trị lớn; còn phép đếm phân phối chỉ có thể làm trong trường hợp các khoá mang giá trị nhỏ, bởi nó cần một lượng bộ nhớ đủ rộng để giăng ra dãy biến đếm số lần xuất hiện cho từng giá trị.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.6', N'Thuật toán sắp xếp kiểu phân đoạn (Quicksort)', N'..\..\public\data\C8\8_6.docx', 8, N'8.11.	THUẬT TOÁN SẮP XẾP TRỘN (MERGESORT)
8.11.1. Phép trộn 2 đường
Phép trộn 2 đường là phép hợp nhất hai dãy khoá đã sắp xếp để ghép lại thành một dãy khoá có kích thước bằng tổng kích thước của hai dãy khoá ban đầu và dãy khoá tạo thành cũng có thứ tự sắp xếp. Nguyên tắc thực hiện của nó khá đơn giản: so sánh hai khoá đứng đầu hai dãy, chọn ra khoá nhỏ nhất và đưa nó vào miền sắp xếp (một dãy khoá phụ có kích thước bằng tổng kích thước hai dãy khoá ban đầu) ở vị trí thích hợp. Sau đó, khoá này bị loại ra khỏi dãy khoá chứa nó. Quá trình tiếp tục cho tới khi một trong hai dãy khoá đã cạn, khi đó chỉ cần chuyển toàn bộ dãy khoá còn lại ra miền sắp xếp là xong.
Ví dụ: Với hai dãy khoá: (1, 3, 10, 11) và (2, 4, 9)
Dãy 1	Dãy 2	Khoá nhỏ nhất trong 2 dãy	Miền sắp xếp
(1, 3, 10, 11)	(2, 4, 9)	1	(1)
(3, 10, 11)	(2, 4, 9)	2	(1, 2)
(3, 10, 11)	(4, 9)	3	(1, 2, 3)
(10, 11)	(4, 9)	4	(1, 2, 3, 4)
(10, 11)	(9)	9	(1, 2, 3, 4, 9)
(10, 11)		Dãy 2 là , đưa nốt dãy 1 vào miền sắp xếp	(1, 2, 3, 4, 9, 10, 11)

8.11.2.	 Sắp xếp bằng trộn 2 đường trực tiếp
Ta có thể coi mỗi khoá trong dãy khoá k1, k2, …, kn là một mạch với độ dài 1, dĩ nhiên các mạch độ dài 1 có thể coi là đã được sắp. Nếu trộn hai mạch liên tiếp lại thành một mạch có độ dài 2, ta lại được dãy gồm các mạch đã được sắp. Cứ tiếp tục như vậy, số mạch trong dãy sẽ giảm dần sau mỗi lần trộn 
 
Thuật toán sắp xếp trộn

Để tiến hành thuật toán sắp xếp trộn hai đường trực tiếp, ta viết các thủ tục:
Thủ tục Merge(var x, y: TArray; a, b, c: Integer); thủ tục này trộn mạch xa, xa+1, …, xb với mạch xb+1, xb+2 …, xc để được mạch ya, ya+1, …, yc.
Thủ tục MergeByLength(var x, y: TArray; len: Integer); thủ tục này trộn lần lượt các cặp mạch theo thứ tự:
Trộn mạch x1…xlen và xlen+1…x2len thành mạch y1…y2len.
Trộn mạch x2len+1…x3len và x3len+1 …x4len thành mạch y2len+1…y4len.
…
Lưu ý rằng đến cuối cùng ta có thể gặp hai trường hợp: Hoặc còn lại hai mạch mà mạch thứ hai có độ dài < len. Hoặc chỉ còn lại một mạch. Trường hợp thứ nhất ta phải quản lý chính xác các chỉ số để thực hiện phép trộn, còn trường hợp thứ hai thì không được quên thao tác đưa thẳng mạch duy nhất còn lại sang dãy y.
Cuối cùng là thủ tục MergeSort, thủ tục này cần một dãy khoá phụ t1, t2, …, tn. Trước hết ta gọi MergeByLength(k, t, 1) để trộn hai phần tử liên tiếp của k thành một mạch trong t, sau đó lại gọi MergeByLength(t, k, 2) để trộn hai mạch liên tiếp trong t thành một mạch trong k, rồi lại gọi MergeByLength(k, t, 4) để trộn hai mạch liên tiếp trong k thành một  mạch trong t …Như vậy k và t được sử dụng với vai trò luân phiên: một dãy chứa các mạch và một dãy dùng để trộn các cặp mạch liên tiếp để được mạch lớn hơn.
procedure MergeSort; 
var
t: TArray; {Dãy khoá phụ}
len: Integer;
Flag: Boolean; {Flag = True: trộn các mạch trong k vào t; Flag = False: trộn các mạch trong t vào k}

procedure Merge(var X, Y: TArray; a, b, c: Integer);{Trộn Xa…Xb và Xb+1…Xc}
var
i, j, p: Integer; 
begin
{Chỉ số p chạy trong miền sắp xếp, i chạy theo mạch thứ nhất, j chạy theo mạch thứ hai}
p := a; 
i := a; 
j := b + 1;
while (i  b) and (j  c) then {Chừng nào cả hai mạch đều chưa xét hết}
begin
if Xi  Xj then {So sánh hai phần tử nhỏ nhất trong hai mạch mà chưa bị đưa vào miền sắp xếp}
begin
Yp := Xi; 
i := i + 1; {Đưa xi vào miền sắp xếp và cho i chạy}
end 
else
begin
Yp := Xj; 
j := j + 1; {Đưa xj vào miền sắp xếp và cho j chạy}
end;
p := p + 1;
end;
if i  b then (Yp, Yp+1, …, Yc) := (Xi, Xi+1, …, Xb) {Mạch 2 hết trước, Đưa phần cuối của mạch 1 vào miến sắp xếp}
else (Yp, Yp+1, …, Yc) := (Xj, Xj+1, …, Xc); {Mạch 1 hết trước, Đưa phần cuối của mạch 2 vào miến sắp xếp}
end;

procedure MergeByLength(var X, Y: TArray; len: Integer); 
begin
a := 1; 
b := len; 
c := 2 * len;
while c  n do {Trộn hai mạch xa…xb và xb+1…xc đều có độ dài len}
begin
Merge(X, Y, a, b, c);
a := a + 2 * len; 
b := b + 2 * len; 
c := c + 2 * len; {Dịch các chỉ số a, b, c về sau 2.len vị trí}
end;
if b < n then Merge(X, Y, a, b, n) {Còn lại hai mạch mà mạch thứ hai có độ dài ngắn hơn len}
else
if a  n then (Ya, Ya+1, …, Yn) := (Xa, Xa+1, …, Xn); {Còn lại một mạch thì đưa thẳng mạch đó sang miền y}
end;

begin {Thuật toán sắp xếp trộn}
Flag := True; 
len := 1;
while len < n do 
begin
if Flag then MergeByLength(k, t, len) else MergeByLength(t, k, len); len := len * 2;
Flag := not Flag; {Đảo cờ để luân phiên vai trò của k và t}
end;
if not Flag then k := t; {Nếu kết quả cuối cùng đang nằm trong t thì sao chép kết quả vào k}
end;
Về độ phức tạp của thuật toán, ta thấy rằng trong thủ tục Merge, phép toán tích cực là thao tác đưa một khoá vào miền sắp xếp. Mỗi lần gọi thủ tục MergeByLength, tất cả các phần tử trong dãy khoá được chuyển hoàn toàn sang miền sắp xếp, nên độ phức tạp của thủ tục MergeByLength là O(n). Thủ tục MergeSort có vòng lặp thực hiện không quá log2n + 1 lời gọi MergeByLength bởi biến len sẽ được tăng theo cấp số nhân công bội 2. Từ đó suy ra độ phức tạp của MergeSort là O(nlog2n) bất chấp trạng thái dữ liệu vào.
Cùng là những thuật toán sắp xếp tổng quát với độ phức tạp trung bình như nhau, nhưng không giống như QuickSort hay HeapSort, MergeSort có tính ổn định. Nhược điểm của MergeSort là nó phải dùng thêm một vùng nhớ để chứa dãy khoá phụ có kích thước bằng dãy khoá ban đầu.
Người ta còn có thể lợi dụng được trạng thái dữ liệu vào để khiến MergeSort chạy nhanh hơn: ngay từ đầu, ta không coi mỗi phần tử của dãy khoá là một mạch mà coi những đoạn đã được sắp trong dãy khoá là một mạch. Bởi một dãy khoá bất kỳ có thể coi là gồm các mạch đã sắp xếp nằm liên tiếp nhau. Khi đó người ta gọi phương pháp này là phương pháp trộn hai đường tự nhiên.
Tổng quát hơn nữa, thay vì phép trộn hai mạch, người ta có thể sử dụng phép trộn k mạch, khi đó ta được thuật toán sắp xếp trộn k đường.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.7', N'Thuật toán sắp xếp kiểu vun đống (Heapsort)', N'..\..\public\data\C8\8_7.docx', 8, N'8.12. CÀI ĐẶT
Ta sẽ cài đặt tất cả các thuật toán sắp xếp nêu trên, với dữ liệu vào được đặt trong file văn bản SORT.INP chứa không nhiều hơn 15000 khoá và giá trị mỗi khoá là số tự nhiên không quá 15000. Kết quả được ghi ra file văn bản SORT.OUT chứa dãy khoá được sắp, mỗi khoá trên một dòng.
SORT.INP	SORT.OUT
1 4 3 2 5	1
7 9 8	2
10 6	3
	4
	5
	6
	7
	8
	9
	10

Chương trình có giao diện dưới dạng menu, mỗi chức năng tương ứng với một thuật toán sắp xếp. Tại mỗi thuật toán sắp xếp, ta thêm một vài lệnh đo thời gian thực tế của nó (chỉ đo thời gian thực hiện giải thuật, không tính thời gian nhập liệu và in kết quả).
Ở thuật toán sắp xếp bằng cơ số theo cách hoán vị phần tử, ta chọn hệ nhị phân. Ở thuật toán sắp xếp bằng cơ số trực tiếp, ta sử dụng hệ cơ số 256, khi đó một giá trị số tự nhiên x  15000 sẽ được biểu diễn bằng hai chữ số trong hệ 256:
Chữ số hàng đơn vị là x mod 256 = x mod 28 = x and 255 = x and $FF; Chữ số còn lại (= chữ số ở hàng cao nhất) là x div 256 = x div 28 = x shr 8;
P_2_08_1.PAS * Các thuật toán săp xếp
{$M 65520 0 655360}
program SortingAlgorithmsDemo; 
uses crt;
const
InputFile = ''SORT.INP''; 
OutputFile = ''SORT.OUT'';
 	max = 15000;
maxV = 15000;
Interval = 1193180 / 65536; {Tần số đồng hồ  18.2 lần / giây}
nMenu = 12;
SMenu: array[0..nMenu] of String = (
''	0. Display Input'', 
''	1. SelectionSort'',
''	2. BubbleSort'',
''	3. InsertionSort'',
''	4. InsertionSort with binary searching'', 
'' 	5. ShellSort'',
''	6. QuickSort'',
''	7. HeapSort'',
''	8. Distribution Counting'', 
''	9. Exchange RadixSort'',
''	10. Straight RadixSort'', 
'' 	11. MergeSort'',
''	12. Exit''
);
type
TArr = array[1..max] of Integer; 
TCount = array[0..maxV] of Integer;
var
k: TArr;
n: Integer; 
selected: Integer; 
StTime: LongInt;
Time: LongInt absolute 0:$46C; {Biến đếm nhịp đồng hồ}

procedure Enter; {Trước mỗi thuật toán sắp xếp, gọi thủ tục này để nhập liệu}
var
f: Text; 
begin
Assign(f, InputFile); 
Reset(f); 
n := 0;
while not SeekEof(f) do 
begin
Inc(n); 
Read(f, k[n]); 
end;
Close(f);
StTime := Time; {Nhập xong bắt đầu tính thời gian ngay}
end;

procedure PrintInput; {In dữ liệu}
var
i: Integer; 
begin
Enter;
for i := 1 to n do Write(k[i]:8); 
Write(''Press any key to return to menu…'');
ReadKey; 
end;

procedure PrintResult; {In kết quả của mỗi thuật toán sắp xếp}
var
f: Text;
i: Integer; 
ch: Char;
begin
{Trước hết in ra thời gian thực thi}
WriteLn(''Running Time = '', (Time - StTime) / Interval:1:10, '' (s)''); 
Assign(f, OutputFile); 
Rewrite(f);
for i := 1 to n do WriteLn(f, k[i]);
Close(f);
Write(''Press <P> to print Output, another key to return to menu…''); 
ch := ReadKey; 
WriteLn(ch);
if Upcase(ch) = ''P'' then 
begin
for i := 1 to n do Write(k[i]:8); 
WriteLn;
Write(''Press any key to return to menu…''); 
ReadKey;
end;
end;

procedure Swap(var x, y: Integer); {Thủ tục đảo giá trị hai tham biến x, y}
var
t: Integer; 
begin
t := x; 
x := y; 
y := t; 
end;

(** SELECTIONSORT *************************************************) procedure SelectionSort;
var
i, j, jmin: Integer; 
begin
Enter;
for i := 1 to n - 1 do 
begin
jmin := i;
for j := i + 1 to n do
if k[j] < k[jmin] then jmin := j; if jmin <> i then Swap(k[i], k[jmin]);
end;
PrintResult;
end;

(** BUBBLESORT ****************************************************) procedure BubbleSort;
var
i, j: Integer; 
begin
Enter;
for i := 2 to n do
for j := n downto i do
if k[j - 1] > k[j] then Swap(k[j - 1], k[j]); 
PrintResult;
end;

(** INSERTIONSORT *************************************************) procedure InsertionSort;
var
i, j, tmp: Integer; 
begin
Enter;
for i := 2 to n do 
begin
tmp := k[i]; 
j := i - 1;
while (j > 0) and (tmp < k[j]) do 
begin
k[j + 1] := k[j];
Dec(j);
end;
k[j + 1] := tmp; 
end;
PrintResult;
end;

(** INSERTIONSORT WITH BINARY SEARCHING ***************************) 
procedure AdvancedInsertionSort;
var
i, inf, sup, median, tmp: Integer; 
begin
Enter;
for i := 2 to n do 
begin
tmp := k[i];
inf := 1; 
sup := i - 1; 
repeat
median := (inf + sup) shr 1;
if tmp < k[median] then sup := median - 1 
else inf := median + 1;
until inf > sup;
Move(k[inf], k[inf + 1], (i - inf) * SizeOf(k[1])); 
k[inf] := tmp;
end;
PrintResult;
end;

(** SHELLSORT *****************************************************) procedure ShellSort;
var
tmp: Integer;
i, j, h: Integer; 
begin
Enter;
h := n shr 1; 
while h <> 0 do
begin
for i := h + 1 to n do 
begin
tmp := k[i]; 
j := i - h;
while (j > 0) and (k[j] > tmp) do 
begin
k[j + h] := k[j]; 
j := j - h;
end;
k[j + h] := tmp; 
end;
h := h shr 1; 
end;
PrintResult; 
end;

(** QUICKSORT *****************************************************) procedure QuickSort;

procedure Partition(L, H: Integer); 
var
i, j: Integer;
Pivot: Integer;
begin
if L >= H then Exit;
Pivot := k[L + Random(H - L + 1)]; 
i := L; 
j := H;
repeat
while k[i] < Pivot do Inc(i); 
while k[j] > Pivot do Dec(j); 
if i <= j then
begin
if i < j then Swap(k[i], k[j]);
Inc(i); 
Dec(j); 
end;
until i > j;
Partition(L, j); 
Partition(i, H); 
end;

begin
Enter;
Partition(1, n);
PrintResult;
end;

(** HEAPSORT ******************************************************) procedure HeapSort;
var
r, i: Integer;

procedure Adjust(root, endnode: Integer); 
var
key, c: Integer; 
begin
key := k[root];
while root shl 1 <= endnode do 
begin
c := root shl 1;
if (c < endnode) and (k[c] < k[c + 1]) then Inc(c); 
if k[c] <= key then Break;
k[root] := k[c]; 
root := c; 
end;
k[root] := key; 
end;

begin
Enter;
for r := n shr 1 downto 1 do Adjust(r, n); 
for i := n downto 2 do
begin
Swap(k[1], k[i]);
Adjust(1, i - 1);
end;
PrintResult;
end;

(** DISTRIBUTION COUNTING ******************************************) 
procedure DistributionCounting;
var
x: TArr; c: TCount;
i, V: Integer; 
begin
Enter;
FillChar(c, SizeOf(c), 0);
for i := 1 to n do Inc(c[k[i]]);
for V := 1 to MaxV do c[V] := c[V - 1] + c[V]; 
for i := n downto 1 do
begin
V := k[i]; 
x[c[V]] := k[i]; 
Dec(c[V]);
end; 
k := x;
PrintResult; 
end;
 

(** EXCHANGE RADIXSORT ********************************************) 
procedure RadixSort;
const
MaxBit = 13; 
var
MaskBit: array[0..MaxBit] of Integer; 
MaxValue, i: Integer;

procedure Partition(L, H, BIndex: Integer); 
var
i, j, Mask: Integer; 
begin
if L >= H then Exit;
i := L; j := H; Mask := MaskBit[BIndex]; 
repeat
while (i < j) and (k[i] and Mask = 0) do Inc(i); 
while (i < j) and (k[j] and Mask <> 0) do Dec(j); 
Swap(k[i], k[j]);
until i = j;
if k[j] and Mask = 0 then Inc(j); 
if BIndex > 0 then
begin
Partition(L, j - 1, BIndex - 1); 
Partition(j, H, BIndex - 1); 
end;
end;

begin
Enter;
for i := 0 to MaxBit do MaskBit[i] := 1 shl i; 
maxValue := k[1];
for i := 2 to n do
if k[i] > MaxValue then maxValue := k[i]; 
i := 0;
while (i < MaxBit) and (MaskBit[i + 1] <= MaxValue) do Inc(i); 
Partition(1, n, i);
PrintResult; 
end;

(** STRAIGHT RADIXSORT ********************************************) 
procedure StraightRadixSort;
const
Radix = 256;
nDigit = 2; 
var
t: TArr;
p: Integer;
Flag: Boolean;

function GetDigit(key, p: Integer): Integer; 
begin
if p = 0 then GetDigit := key and $FF else GetDigit := key shr 8;
end;

procedure DCount(var x, y: TArr; p: Integer); 
var
c: array[0..Radix - 1] of Integer; i, d: Integer;
begin
FillChar(c, SizeOf(c), 0); 
for i := 1 to n do
begin
d := GetDigit(x[i], p); Inc(c[d]);
end;
for d := 1 to Radix - 1 do c[d] := c[d - 1] + c[d]; 
for i := n downto 1 do
begin
d := GetDigit(x[i], p);
y[c[d]] := x[i];
Dec(c[d]);
end;
end;

begin
Enter;
Flag := True;
for p := 0 to nDigit - 1 do 
begin
if Flag then DCount(k, t, p) 
else DCount(t, k, p);
Flag := not Flag; 
end;
if not Flag then k := t;
PrintResult;
end;

(** MERGESORT *****************************************************) procedure MergeSort;
var
t: TArr;
Flag: Boolean; 
len: Integer;

procedure Merge(var Source, Dest: TArr; a, b, c: Integer); 
var
i, j, p: Integer; 
begin
p := a; i := a; j := b + 1; 
while (i <= b) and (j <= c) do
begin
if Source[i] <= Source[j] then 
begin
Dest[p] := Source[i]; 
Inc(i); 
end;
else
begin
Dest[p] := Source[j]; 
Inc(j); 
end;
Inc(p); 
end;
if i <= b then
Move(Source[i], Dest[p], (b - i + 1) * SizeOf(Source[1])) 
else
Move(Source[j], Dest[p], (c - j + 1) * SizeOf(Source[1]));
end;

procedure MergeByLength(var Source, Dest: TArr; len: Integer); 
var
a, b, c: Integer; 
begin
a := 1; 
b := len; 
c := len shl 1; 
while c <= n do
begin
Merge(Source, Dest, a, b, c);
a := a + len shl 1; 
b := b + len shl 1; 
c := c + len shl 1; 
end;
if b < n then Merge(Source, Dest, a, b, n)
else
Move(Source[a], Dest[a], (n - a + 1) * SizeOf(Source[1]));
end;

begin
Enter;
len := 1; 
Flag := True; 
FillChar(t, SizeOf(t), 0); 
while len < n do
begin
if Flag then MergeByLength(k, t, len) 
else MergeByLength(t, k, len);
len := len shl 1; Flag := not Flag;
end;
if not Flag then k := t;
PrintResult;
end; (*******************************************************************)

function MenuSelect: Integer; 
var
ch: Integer; 
begin
Clrscr;
WriteLn(''Sorting Algorithms Demos; Input: SORT.INP; Output: SORT.OUT''); for ch := 0 to nMenu do WriteLn(SMenu[ch]);
Write(''Enter your choice: ''); ReadLn(ch); MenuSelect := ch;
end;

begin
repeat
selected := MenuSelect; 
WriteLn(SMenu[selected]); 
case selected of
0: PrintInput;
1: SelectionSort;
2: BubbleSort;
3: InsertionSort;
4: AdvancedInsertionSort;
5: ShellSort;
6: QuickSort;
7: HeapSort;
8: DistributionCounting;
9: RadixSort;
10: StraightRadixSort;
11: MergeSort;
12: Halt; 
end;
until False; 
end.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.8', N'Sắp xếp bằng phép đếm phân phối (Distribution counting)', N'..\..\public\data\C8\8_8.docx', 8, N'8.13. ĐÁNH GIÁ, NHẬN XÉT
Những con số về thời gian và tốc độ chương trình đo được là qua thử nghiệm trên một bộ dữ liệu cụ thể, với một máy tính cụ thể và một công cụ lập trình cụ thể. Với bộ dữ liệu khác, máy tính và công cụ lập trình khác, kết quả có thể khác. Tuy vậy, việc đo thời gian thực thi của từng thuật toán sắp xếp vẫn cần thiết nếu ta muốn so sánh tốc độ của các thuật toán cùng cấp phức tạp bởi các tính toán trên lý thuyết đôi khi bị lệch so với thực tế vì nhiều lý do khác nhau.
Có một vấn đề đặt ra là ngoài những thuật toán sắp xếp cấp O(n2), rất khó có thể đo được tốc độ trung bình của những thuật toán sắp xếp còn lại khi mà chúng đều chạy không tới một nhịp đồng hồ thời gian thực (đều cho thời gian chạy bằng 0 do không kịp đo thời gian). Một cách giải quyết là cho mỗi thuật toán QuickSort, RadixSort, … thực hiện c lần (c là một số nguyên đủ lớn) trên các bộ dữ liệu ngẫu nhiên rồi lấy thời gian tổng chia cho c, hay có thể tăng kích thước dữ liệu (điều này có thể dẫn đến việc phải sửa lại một vài chỗ trong chương trình hoặc thậm chí phải thay đổi môi trường lập trình).
Tôi đã viết lại chương trình này trên Borland Delphi để đưa vào một số cải tiến:
•	Có thể chạy với kích thước dữ liệu lớn hơn rất nhiều (hàng triệu khóa)
•	Thiết kế dựa trên kiến trúc đa luồng (MultiThreads) cho phép chạy đồng thời hai hay nhiều thuật toán sắp xếp để so sánh tốc độ, hiển thị quá trình sắp xếp trực quan trên màn hình.
•	Cũng cho phép chạy tuần tự các thuật toán sắp xếp để đo thời gian thực hiện chính xác của chúng.
Chú ý: Để chương trình không bị ảnh hưởng bởi các phần mềm khác đang chạy, khi bấm   hoặc   khởi động các threads, bàn phím, chuột và tất cả các phần mềm khác sẽ bị treo tạm  thời đến khi các threads thực hiện xong. Vì vậy không nên chạy các thuật toán sắp xếp chậm với dữ liệu lớn, sẽ không thể đợi đến khi các threads kết thúc và sẽ phải tắt máy khởi động lại. Hình dưới đây là giao diện của chương trình, bạn có thể tham khảo mã nguồn chương trình kèm theo:
 
Cài đặt các thuật toán sắp xếp với dữ liệu lớn
Cùng một mục đích sắp xếp như nhau, nhưng có nhiều phương pháp giải quyết khác nhau. Nếu chỉ dựa vào thời gian đo được trong một ví dụ cụ thể mà đánh giá thuật toán này tốt hơn thuật toán kia về mọi mặt là điều không nên. Việc chọn một thuật toán sắp xếp thích hợp cho phù hợp với từng yêu cầu, từng điều kiện cụ thể là kỹ năng của người lập trình.
Những thuật toán có độ phức tạp O(n2) thì chỉ nên áp dụng trong chương trình có ít lần sắp xếp và với kích thước n nhỏ. Về tốc độ, BubbleSort luôn luôn đứng bét, nhưng mã lệnh của nó lại hết sức đơn giản mà người mới học lập trình nào cũng có thể cài đặt được, tính ổn định của BubbleSort cũng rất đáng chú ý. Trong những thuật toán có độ phức tạp O(n2), InsertionSort tỏ ra nhanh hơn những phương pháp còn lại và cũng có tính ổn định, mã lệnh cũng tương đối đơn giản, dễ nhớ. SelectionSort thì không ổn định nhưng với n nhỏ, việc chọn ra m phần tử nhỏ nhất có thể thực hiện dễ dàng chứ không cần phải sắp xếp lại toàn bộ như sắp xếp chèn.
Thuật toán đếm phân phối và thuật toán sắp xếp bằng cơ số nên được tận dụng trong trường hợp các khoá sắp xếp là số tự nhiên (hay là một kiểu dữ liệu có thể quy ra thành các số tự nhiên) bởi những thuật toán này có tốc độ rất cao. Thuật toán sắp xếp bằng cơ số cũng có thể sắp xếp dãy khoá có số thực hay số âm nhưng ta phải biết được cách thức lưu trữ các kiểu dữ liệu đó trên máy tính thì mới có thể làm được.
QuickSort, HeapSort, MergeSort và ShellSort là những thuật toán sắp xếp tổng quát, dãy khoá thuộc kiểu dữ liệu có thứ tự nào cũng có thể áp dụng được chứ không nhất thiết phải là các số.
QuickSort gặp nhược điểm trong trường hợp suy biến nhưng xác suất xảy ra trường hợp này rất nhỏ. HeapSort thì mã lệnh hơi phức tạp và khó nhớ, nhưng nếu cần chọn ra m phần tử lớn nhất trong dãy khoá thì dùng HeapSort sẽ không phải sắp xếp lại toàn bộ dãy. MergeSort phải đòi hỏi thêm một không gian nhớ phụ, nên áp dụng nó trong trường hợp sắp xếp trên file. Còn ShellSort thì hơi khó trong việc đánh giá về thời gian thực thi, nó là sửa đổi của thuật toán sắp xếp chèn nhưng lại có tốc độ tốt, mã lệnh đơn giản và lượng bộ nhớ cần huy động rất ít. Tuy nhiên, những nhược điểm của bốn phương pháp này quá nhỏ so với ưu điểm chung của chúng là nhanh. Hơn nữa, chúng được đánh giá cao không chỉ vì tính tổng quát và tốc độ nhanh, mà còn là kết quả của những cách tiếp cận khoa học đối với bài toán sắp xếp.
Những thuật toán trên không chỉ đơn thuần là cho ta hiểu thêm về một cách sắp xếp mới, mà kỹ thuật cài đặt chúng (với mã lệnh tối ưu) cũng dạy cho chúng ta nhiều điều: Kỹ thuật sử dụng số ngẫu nhiên, kỹ thuật "chia để trị", kỹ thuật dùng các biến với vai trò luân phiên v.v…Vậy nên nắm vững nội dung của những thuật toán đó, mà cách thuộc tốt nhất chính là cài đặt chúng vài lần với các ràng buộc dữ liệu khác nhau (nếu có thể thử được trên hai ngôn ngữ lập trình thì rất tốt) và cũng đừng quên kỹ thuật sắp xếp bằng chỉ số.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'8.9', N'Tính ổn định của thuật toán sắp xếp (Stability)', N'..\..\public\data\C8\8_9.docx', 8, N'Bài tập
Bài 1
Viết thuật toán QuickSort không đệ quy 
Bài 2
Hãy viết những thuật toán sắp xếp nêu trên với danh sách những xâu ký tự gồm 3 chữ cái thường, để sắp xếp chúng theo thứ tự từ điển.
Bài 3
Hãy viết lại tất cả những thuật toán nêu trên với phương pháp sắp xếp bằng chỉ số trên một dãy số cần sắp không tăng (giảm dần).
Bài 4
Cho một danh sách thí sinh gồm n người, mỗi người cho biết tên và điểm thi, hãy chọn ra m người điểm cao nhất. Giải quyết bằng thuật toán có độ phức tạp tính toán trung bình O(n)
Bài 5
Thuật toán sắp xếp bằng cơ số trực tiếp có ổn định không ? Tại sao ? 
Bài 6
Cài đặt thuật toán sắp xếp trộn hai đường tự nhiên 
Bài 7
Tìm hiểu phép trộn k đường và các phương pháp sắp xếp ngoài (trên tệp truy nhập tuần tự và tệp truy nhập ngẫu nhiên)
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'9.1', N'Bài toán tìm kiếm', N'..\..\public\data\C9\9_1.docx', 9, N'9.1. BÀI TOÁN TÌM KIẾM
Cùng với sắp xếp, tìm kiếm là một đòi hỏi rất thường xuyên trong các ứng dụng tin học. Bài toán tìm kiếm có thể phát biểu như sau:
Cho một dãy gồm n bản ghi r1, r2, …, rn. Mỗi bản ghi ri (1  i  n) tương ứng với một khoá ki. Hãy tìm bản ghi có giá trị khoá bằng X cho trước.
X được gọi là khoá tìm kiếm hay đối trị tìm kiếm (argument).
Công việc tìm kiếm sẽ hoàn thành nếu như có một trong hai tình huống sau xảy ra:
Tìm được bản ghi có khoá tương ứng bằng X, lúc đó phép tìm kiếm thành công (successful). Không tìm được bản ghi nào có khoá tìm kiếm bằng X cả, phép tìm kiếm thất bại (unsuccessful).
Tương tự như sắp xếp, ta coi khoá của một bản ghi là đại diện cho bản ghi đó. Và trong một số thuật toán sẽ trình bày dưới đây, ta coi kiểu dữ liệu cho mỗi khoá cũng có tên gọi là TKey.
const
n = …; {Số khoá trong dãy khoá, có thể khai dưới dạng biến số nguyên để tuỳ biến hơn}
type
TKey = …; {Kiểu dữ liệu một khoá}
TArray = array[1..n] of TKey; var
k: TArray; {Dãy khoá}
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'9.10', N'Bài tập về tìm kiếm', N'..\..\public\data\C9\EX.docx', 9, N'9.2. TÌM KIẾM TUẦN TỰ (SEQUENTIAL SEARCH)
Tìm kiếm tuần tự là một kỹ thuật tìm kiếm đơn giản. Nội dung của nó như sau: Bắt đầu từ bản ghi đầu tiên, lần lượt so sánh khoá tìm kiếm với khoá tương ứng của các bản ghi trong danh sách, cho tới khi tìm thấy bản ghi mong muốn hoặc đã duyệt hết danh sách mà chưa thấy
{Tìm kiếm tuần tự trên dãy khoá k1, k2, …, kn; hàm này thử tìm xem trong dãy có khoá nào = X không, nếu thấy nó trả về chỉ số của khoá ấy, nếu không thấy nó trả về 0. Có sử dụng một khoá phụ kn+1 được gán giá trị = X}
function SequentialSearch(X: TKey): Integer; 
var
i: Integer; 
begin
i := 1;
while (i <= n) and (ki  X) do i := i + 1; 
if i = n + 1 then SequentialSearch := 0; 
else SequentialSearch := i;
end;
Dễ thấy rằng độ phức tạp của thuật toán tìm kiếm tuần tự trong trường hợp tốt nhất là O(1),
trong trường hợp xấu nhất là O(n) và trong trường hợp trung bình cũng là O(n).
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'9.2', N'Tìm kiếm tuần tự (Sequential Search)', N'..\..\public\data\C9\9_2.docx', 9, N'9.3. TÌM KIẾM NHỊ PHÂN (BINARY SEARCH)
Phép tìm kiếm nhị phân có thể áp dụng trên dãy khoá đã có thứ tự: k1  k2  …  kn.
Giả sử ta cần tìm trong đoạn kinf, kinf+1, …, ksup với khoá tìm kiếm là X, trước hết ta xét khoá nằm giữa dãy kmedian với median = (inf + sup) div 2;
Nếu kmedian < X thì có nghĩa là đoạn từ kinf tới kmedian chỉ chứa toàn khoá < X, ta tiến hành tìm kiếm tiếp với đoạn từ kmedian + 1 tới ksup.
Nếu kmedian > X thì có nghĩa là đoạn từ kmedian tới ksup chỉ chứa toàn khoá > X, ta tiến hành tìm kiếm tiếp với đoạn từ kinf tới kmedian - 1.
Nếu kmedian = X thì việc tìm kiếm thành công (kết thúc quá trình tìm kiếm).
Quá trình tìm kiếm sẽ thất bại nếu đến một bước nào đó, đoạn tìm kiếm là rỗng (inf > sup).
{Tìm kiếm nhị phân trên dãy khoá k1  k2  …  kn; hàm này thử tìm xem trong dãy có khoá nào = X không, nếu thấy nó trả về chỉ số của khoá ấy, nếu không thấy nó trả về 0}
function BinarySearch(X: TKey): Integer; 
var
inf, sup, median: Integer; 
begin
inf := 1; 
sup := n; 
while inf  sup do
begin
median := (inf + sup) div 2; 
if kmedian = X then
begin
BinarySearch := median;
Exit;
end;
if kmedian < X then inf := median + 1 
else sup := median - 1;
end;
BinarySearch := 0;
end;
Người ta đã chứng minh được độ phức tạp tính toán của thuật toán tìm kiếm nhị phân trong trường hợp tốt nhất là O(1), trong trường hợp xấu nhất là O(log2n) và trong trường hợp trung bình cũng là O(log2n). Tuy nhiên, ta không nên quên rằng trước khi sử dụng tìm kiếm nhị phân, dãy khoá phải được sắp xếp rồi, tức là thời gian chi phí cho việc sắp xếp cũng phải tính đến. Nếu dãy khoá luôn luôn biến động bởi phép bổ sung hay loại bớt đi thì lúc đó chi phí cho sắp xếp lại nổi lên rất rõ làm bộc lộ nhược điểm của phương pháp này.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'9.3', N'Tìm kiếm nhị phân (Binary Search)', N'..\..\public\data\C9\9_3.docx', 9, N'9.4. CÂY NHỊ PHÂN TÌM KIẾM (BINARY SEARCH TREE - BST)
Cho n khoá k1, k2, …, kn, trên các khoá có quan hệ thứ tự toàn phần. Cây nhị phân tìm kiếm ứng với dãy khoá đó là một cây nhị phân mà mỗi nút chứa giá trị một khoá trong n khoá đã cho, hai giá trị chứa trong hai nút bất kỳ là khác nhau. Đối với mọi nút trên cây, tính chất sau luôn được thoả mãn:
•	Mọi khoá nằm trong cây con trái của nút đó đều nhỏ hơn khoá ứng với nút đó.
•	Mọi khoá nằm trong cây con phải của nút đó đều lớn hơn khoá ứng với nút đó
 
Cây nhị phân tìm kiếm
Thuật toán tìm kiếm trên cây có thể mô tả chung như sau:
Trước hết, khoá tìm kiếm X được so sánh với khoá ở gốc cây, và 4 tình huống có thể xảy ra: Không có gốc (cây rỗng): X không có trên cây, phép tìm kiếm thất bại
X trùng với khoá ở gốc: Phép tìm kiếm thành công
X nhỏ hơn khoá ở gốc, phép tìm kiếm được tiếp tục trong cây con trái của gốc với cách làm tương tự
X lớn hơn khoá ở gốc, phép tìm kiếm được tiếp tục trong cây con phải của gốc với cách làm tương tự
Giả sử cấu trúc một nút của cây được mô tả như sau:
type
PNode = ^TNode; {Con trỏ chứa liên kết tới một nút}
TNode = record {Cấu trúc nút}
Info: TKey; {Trường chứa khoá}
Left, Right: PNode; {con trỏ tới nút con trái và phải, trỏ tới nil nếu không có nút con trái (phải)}
end;
Gốc của cây được lưu trong con trỏ Root. Cây rỗng thì Root = nil
Thuật toán tìm kiếm trên cây nhị phân tìm kiếm có thể viết như sau:
{Hàm tìm kiếm trên BST, nó trả về nút chứa khoá tìm kiếm X nếu tìm thấy, trả về nil nếu không tìm thấy}
function BSTSearch(X: TKey): PNode; var
p: PNode; 
begin
p := Root; {Bắt đầu với nút gốc}
while p  nil do
if X = p^.Info then Break; 
else
if X < p^.Info then p := p^.Left else p := p^.Right;
BSTSearch := p; 
end;
Thuật toán dựng cây nhị phân tìm kiếm từ dãy khoá k1, k2, …, kn cũng được làm gần giống quá trình tìm kiếm. Ta chèn lần lượt các khoá vào cây, trước khi chèn, ta tìm xem khoá đó đã có trong cây hay chưa, nếu đã có rồi thì bỏ qua, nếu nó chưa có thì ta thêm nút mới chứa khoá cần chèn và nối nút đó vào cây nhị phân tìm kiếm.
{Thủ tục chèn khoá X vào BST}
procedure BSTInsert(X); 
var
p, q: PNode; 
begin
q := nil; 
p := Root; {Bắt đầu với p = nút gốc; q là con trỏ chạy đuổi theo sau}
while p  nil do 
begin
q := p;
if X = p^.Info then Break;
else {X  p^.Info thì cho p chạy sang nút con, q^ luôn giữ vai trò là cha của p^}
if X < p^.Info then p := p^.Left 
else p := p^.Right;
end;
if p = nil then {Khoá X chưa có trong BST}
begin
New(p); {Tạo nút mới}
p^.Info := X; {Đưa giá trị X vào nút mới tạo ra}
p^.Left := nil; 
p^.Right := nil; {Nút mới khi chèn vào BST sẽ trở thành nút lá} 
if Root = nil then Root := NewNode {BST đang rỗng, đặt Root là nút mới tạo} 
else {Móc NewNode^ vào nút cha q^}
if X < q^.Info then q^.Left := NewNode 
else q^.Right := NewNode;
end; 
end;
Phép loại bỏ trên cây nhị phân tìm kiếm không đơn giản như phép bổ sung hay phép tìm kiếm.
Muốn xoá một giá trị trong cây nhị phân tìm kiếm (Tức là dựng lại cây mới chứa tất cả những giá trị còn lại), trước hết ta tìm xem giá trị cần xoá nằm ở nút D nào, có ba khả năng xảy ra:
•	Nút D là nút lá, trường hợp này ta chỉ việc đem mối nối cũ trỏ tới nút D (từ nút cha của D) thay bởi nil, và giải phóng bộ nhớ cấp cho nút D (Hình 38).
 
Xóa nút lá ở cây BST
•	Nút D chỉ có một nhánh con, khi đó ta đem nút gốc của nhánh con đó thế vào chỗ nút D, tức là chỉnh lại mối nối: Từ nút cha của nút D không nối tới nút D nữa mà nối tới nhánh con duy nhất của nút D. Cuối cùng, ta giải phóng bộ nhớ đã cấp cho nút D
 
Xóa nút chỉ có một nhánh con trên cây BST
•	Nút D có cả hai nhánh con trái và phải, khi đó có hai cách làm đều hợp lý cả:
o	Hoặc tìm nút chứa khoá lớn nhất trong cây con trái, đưa giá trị chứa trong đó sang nút D, rồi xoá nút này. Do tính chất của cây BST, nút chứa khoá lớn nhất trong cây con trái chính là nút cực phải của cây con trái nên nó không thể có hai con được, việc xoá đưa về hai trường hợp trên (Hình 40)
 
Xóa nút có cả hai nhánh con trên cây BST thay bằng nút cực phải của cây con trái
o Hoặc tìm nút chứa khoá nhỏ nhất trong cây con phải, đưa giá trị chứa trong đó sang nút D, rồi xoá nút này. Do tính chất của cây BST, nút chứa khoá nhỏ nhất trong cây con phải chính là nút cực trái của cây con phải nên nó không thể có hai con được, việc xoá đưa về hai trường hợp trên.
 
Xóa nút có cả hai nhánh con trên cây BST thay bằng nút cực trái của cây con phải
{Thủ tục xoá khoá X khỏi BST} 
procedure BSTDelete(X: TKey); 
var
p, q, Node, Child: PNode; 
begin
p := Root; 
q := nil; {Về sau, khi p trỏ sang nút khác, ta luôn giữ cho q^ luôn là cha của p^}
while p  nil do {Tìm xem trong cây có khoá X không?}
begin
if p^.Info = X then Break; {Tìm thấy}
q := p;
if X < p^.Info then p := p^.Left 
else p := p^.Right;
end;
if p = nil then Exit; {X không tồn tại trong BST nên không xoá được}
if (p^.Left  nil) and (p^.Right  nil) then {p^ có cả con trái và con phải}
begin
Node := p; {Giữ lại nút chứa khoá X}
q := p; 
p := p^.Left; {Chuyển sang nhánh con trái để tìm nút cực phải}
while p^.Right  nil do 
begin
q := p; 
p := p^.Right; 
end;
Node^.Info := p^.Info; {Chuyển giá trị từ nút cực phải trong nhánh con trái lên Node^}
end;
{Nút bị xoá giờ đây là nút p^, nó chỉ có nhiều nhất một con}
{Nếu p^ có một nút con thì đem Child trỏ tới nút con đó, nếu không có thì Child = nil }
if p^.Left  nil then Child := p^.Left 
else Child := p^.Right;
if p = Root then Root := Child; {Nút p^ bị xoá là gốc cây}
else {Nút bị xoá p^ không phải gốc cây thì lấy mối nối từ cha của nó là q^ nối thẳng tới Child}
if q^.Left = p then q^.Left := Child 
else q^.Right := Child;
Dispose(p); 
end;
Trường hợp trung bình, thì các thao tác tìm kiếm, chèn, xoá trên BST có độ phức tạp là O(log2n). Còn trong trường hợp xấu nhất, cây nhị phân tìm kiếm bị suy biến thì các thao tác đó đều có độ phức tạp là O(n), với n là số nút trên cây BST.
Nếu ta mở rộng hơn khái niệm cây nhị phân tìm kiếm như sau: Giá trị lưu trong một nút lớn hơn hoặc bằng các giá trị lưu trong cây con trái và nhỏ hơn các giá trị lưu trong cây con phải. Thì chỉ cần sửa đổi thủ tục BSTInsert một chút, khi chèn lần lượt vào cây n giá trị, cây BST sẽ có n nút (có thể có hai nút chứa cùng một giá trị). Khi đó nếu ta duyệt các nút của cây theo kiểu trung thứ tự (inorder traversal), ta sẽ liệt kê được các giá trị lưu trong cây theo thứ tự tăng dần. Phương pháp sắp xếp này người ta gọi là Tree Sort. Độ phức tạp tính toán trung bình của Tree Sort là O(nlog2n).
Phép tìm kiếm trên cây BST sẽ kém hiệu quả nếu như cây bị suy biến, người ta có nhiều cách xoay xở để tránh trường hợp này. Đó là phép quay cây để dựng cây nhị phân cân đối AVL, hay kỹ thuật dựng cây nhị phân tìm kiếm tối ưu. Những kỹ thuật này ta có thể tham khảo trong các tài liệu khác về cấu trúc dữ liệu và giải thuật.

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'9.4', N'Cây nhị phân tìm kiếm (Binary Search Tree - BST)', N'..\..\public\data\C9\9_4.docx', 9, N'9.5. PHÉP BĂM (HASH)
Tư tưởng của phép băm là dựa vào giá trị các khoá k1, k2, …, kn, chia các khoá đó ra thành các nhóm. Những khoá thuộc cùng một nhóm có một đặc điểm chung và đặc điểm này không có trong các nhóm khác. Khi có một khoá tìm kiếm X, trước hết ta xác định xem nếu X thuộc vào dãy khoá đã cho thì nó phải thuộc nhóm nào và tiến hành tìm kiếm trên nhóm đó.
Một ví dụ là trong cuốn từ điển, các bạn sinh viên thường dán vào 26 mảnh giấy nhỏ vào các trang để đánh dấu trang nào là trang khởi đầu của một đoạn chứa các từ có cùng chữ cái đầu. Để khi tra từ chỉ cần tìm trong các trang chứa những từ có cùng chữ cái đầu với từ cần tìm.
 
Một ví dụ khác là trên dãy các khoá số tự nhiên, ta có thể chia nó là làm m nhóm, mỗi nhóm gồm các khoá đồng dư theo mô-đun m.
Có nhiều cách cài đặt phép băm:
Cách thứ nhất là chia dãy khoá làm các đoạn, mỗi đoạn chứa những khoá thuộc cùng một nhóm và ghi nhận lại vị trí các đoạn đó. Để khi có khoá tìm kiếm, có thể xác định được ngay cần phải tìm khoá đó trong đoạn nào.
Cách thứ hai là chia dãy khoá làm m nhóm, Mỗi nhóm là một danh sách nối đơn chứa các giá trị khoá và ghi nhận lại chốt của mỗi danh sách nối đơn. Với một khoá tìm kiếm, ta xác định được phải tìm khoá đó trong danh sách nối đơn nào và tiến hành tìm kiếm tuần tự trên danh sách nối đơn đó. Với cách lưu trữ này, việc bổ sung cũng như loại bỏ một giá trị khỏi tập hợp khoá dễ dàng hơn rất nhiều phương pháp trên.
Cách thứ ba là nếu chia dãy khoá làm m nhóm, mỗi nhóm được lưu trữ dưới dạng cây nhị phân tìm kiếm và ghi nhận lại gốc của các cây nhị phân tìm kiếm đó, phương pháp này có thể nói là tốt hơn hai phương pháp trên, tuy nhiên dãy khoá phải có quan hệ thứ tự toàn phần thì mới làm được.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'9.5', N'Phép băm (Hash)', N'..\..\public\data\C9\9_5.docx', 9, N'9.6. KHOÁ SỐ VỚI BÀI TOÁN TÌM KIẾM
Mọi dữ liệu lưu trữ trong máy tính đều được số hoá, tức là đều được lưu trữ bằng các đơn vị Bit, Byte, Word v.v… Điều đó có nghĩa là một giá trị khoá bất kỳ, ta hoàn toàn có thể biết được nó được mã hoá bằng con số như thế nào. Và một điều chắc chắn là hai khoá khác nhau sẽ được lưu trữ bằng hai số khác nhau.
Đối với bài toán sắp xếp, ta không thể đưa việc sắp xếp một dãy khoá bất kỳ về việc sắp xếp trên một dãy khoá số là mã của các khoá. Bởi quan hệ thứ tự trên các con số đó có thể khác với thứ tự cần sắp của các khoá.
Nhưng đối với bài toán tìm kiếm thì khác, với một khoá tìm kiếm, Câu trả lời hoặc là "Không tìm thấy" hoặc là "Có tìm thấy và ở chỗ …" nên ta hoàn toàn có thể thay các khoá bằng các mã số của nó mà không bị sai lầm, chỉ lưu ý một điều là: hai khoá khác nhau phải mã hoá thành hai số khác nhau mà thôi.
Nói như vậy có nghĩa là việc nghiên cứu những thuật toán tìm kiếm trên các dãy khoá số rất quan trọng, và dưới đây ta sẽ trình bày một số phương pháp đó.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'9.6', N'Khoá số với bài toán tìm kiếm', N'..\..\public\data\C9\9_6.docx', 9, N'9.7. CÂY TÌM KIẾM SỐ HỌC (DIGITAL SEARCH TREE - DST)
Xét dãy khoá k1, k2, …, kn là các số tự nhiên, mỗi giá trị khoá khi đổi ra hệ nhị phân có z chữ số nhị phân (bit), các bit này được đánh số từ 0 (là hàng đơn vị) tới z - 1 từ phải sang trái.
Ví dụ:
 
Đánh số các bit

Cây tìm kiếm số học chứa các giá trị khoá này có thể mô tả như sau: Trước hết, nó là một cây nhị phân mà mỗi nút chứa một giá trị khoá. Nút gốc có tối đa hai cây con, ngoài giá trị khoá chứa ở nút gốc, tất cả những giá trị khoá có bit cao nhất là 0 nằm trong cây con trái, còn tất cả những giá trị khoá có bit cao nhất là 1 nằm ở cây con phải. Đối với hai nút con của nút gốc, vấn đề tương tự đối với bit z - 2 (bit đứng thứ nhì từ trái sang).
So sánh cây tìm kiếm số học với cây nhị phân tìm kiếm, chúng chỉ khác nhau về cách chia hai cây con trái/phải. Đối với cây nhị phân tìm kiếm, việc chia này được thực hiện bằng cách so sánh với khoá nằm ở nút gốc, còn đối với cây tìm kiếm số học, nếu nút gốc có mức là d thì việc chia cây con được thực hiện theo bit thứ d tính từ trái sang (bit z - d) của mỗi khoá.
Ta nhận thấy rằng những khoá bắt đầu bằng bit 0 chắc chắn nhỏ hơn những khoá bắt đầu bằng bit 1, đó là điểm tương đồng giữa cây nhị phân tìm kiếm và cây tìm kiếm số học: Với mỗi nút nhánh: Mọi giá trị chứa trong cây con trái đều nhỏ hơn giá trị chứa trong cây con phải.
 
Cây tìm kiếm số học
Giả sử cấu trúc một nút của cây được mô tả như sau:
type
PNode = ^TNode; {Con trỏ chứa liên kết tới một nút}
TNode = record {Cấu trúc nút}
Info: TKey; {Trường chứa khoá}
Left, Right: PNode; {con trỏ tới nút con trái và phải, trỏ tới nil nếu không có nút con trái (phải)}
end;
Gốc của cây được lưu trong con trỏ Root. Ban đầu nút Root = nil (cây rỗng)
Với khoá tìm kiếm X, việc tìm kiếm trên cây tìm kiếm số học có thể mô tả như sau: Ban đầu đứng ở nút gốc, xét lần lượt các bit của X từ trái sang phải (từ bit z - 1 tới bit 0), hễ gặp bit bằng 0 thì rẽ sang nút con trái, nếu gặp bit bằng 1 thì rẽ sang nút con phải. Quá trình cứ tiếp tục như vậy cho tới khi gặp một trong hai tình huống sau:
•	Đi tới một nút rỗng (do rẽ theo một liên kết nil), quá trình tìm kiếm thất bại do khoá X không có trong cây.
•	Đi tới một nút mang giá trị đúng bằng X, quá trình tìm kiếm thành công
{Hàm tìm kiếm trên cây tìm kiếm số học, nó trả về nút chứa khoá tìm kiếm X nếu tìm thấy, trả về nil nếu không tìm thấy. z là độ dài dãy bit biểu diễn một khoá}
function DSTSearch(X: TKey): PNode; 
var
b: Integer; 
p: PNode;
begin
b := z; p := Root; {Bắt đầu với nút gốc}
while (p  nil) and (p^.Info  X) do {Chưa gặp phải một trong 2 tình huống trên}
begin
b := b - 1; {Xét bit b của X}
if <Bit b của X là 0> then p := p^.Left {Gặp 0 rẽ trái}
else p := p^.Right; {Gặp 1 rẽ phải}
end;
DSTSearch := p;
end;
Thuật toán dựng cây tìm kiếm số học từ dãy khoá k1, k2, …, kn cũng được làm gần giống quá trình tìm kiếm. Ta chèn lần lượt các khoá vào cây, trước khi chèn, ta tìm xem khoá đó đã có trong cây hay chưa, nếu đã có rồi thì bỏ qua, nếu nó chưa có thì ta thêm nút mới chứa khoá cần chèn và nối nút đó vào cây tìm kiếm số học tại mối nối rỗng vừa rẽ sang khiến quá trình tìm kiếm thất bại
{Thủ tục chèn khoá X vào cây tìm kiếm số học}
procedure DSTInsert(X: TKey); 
var
b: Integer; 
p, q: PNode;
begin
b := z;
p := Root;
while (p  nil) and (p^.Info  X) do 
begin
b := b - 1; {Xét bit b của X}
q := p; {Khi p chạy xuống nút con thì q^ luôn giữ vai trò là nút cha của p^}
if <Bit b của X là 0> then p := p^.Left {Gặp 0 rẽ trái}
else p := p^.Right; {Gặp 1 rẽ phải}
end;
if p = nil then	{Giá trị X chưa có trong cây}
begin
New(p); {Tạo ra một nút mới p^}
p^.Info := X; {Nút mới tạo ra sẽ chứa khoá X}
p^.Left := nil; 
p^.Right := nil; {Nút mới đó sẽ trở thành một lá của cây}
if Root = nil then Root := p {Cây đang là rỗng thì nút mới thêm trở thành gốc}
else {Không thì móc p^ vào mối nối vừa rẽ sang từ q^}
if <Bit b của X là 0> then q^.Left := p 
else q^.Right := p;
end; 
end;
Muốn xoá bỏ một giá trị khỏi cây tìm kiếm số học, trước hết ta xác định nút chứa giá trị cần xoá là nút D nào, sau đó tìm trong nhánh cây gốc D ra một nút lá bất kỳ, chuyển giá trị chứa trong nút lá đó sang nút D rồi xoá nút lá.
{Thủ tục xoá khoá X khỏi cây tìm kiếm số học}
procedure DSTDelete(X: TKey); 
var
b: Integer;
p, q, Node: PNode; 
begin
{Trước hết, tìm kiếm giá trị X xem nó nằm ở nút nào}
b := z;
p := Root;
while (p  nil) and (p^.Info  X) do 
begin
b := b - 1;
q := p; {Mỗi lần p chuyển sang nút con, ta luôn đảm bảo cho q^ là nút cha của p^}
if <Bit b của X là 0> then p := p^.Left 
else p := p^.Right;
end;
if p = nil then Exit; {X không tồn tại trong cây thì không xoá được}
Node := p; {Giữ lại nút chứa khoá cần xoá}
while (p^.Left  nil) or (p^.Right  nil) do {chừng nào p^ chưa phải là lá}
begin
q := p; {q chạy đuổi theo p, còn p chuyển xuống một trong 2 nhánh con}
if p^.Left  nil then p := p^.Left 
else p := p^.Right;
end;
Node^.Info := p^.Info; {Chuyển giá trị từ nút lá p^ sang nút Node^}
if Root = p then Root := nil {Cây chỉ gồm một nút gốc và bây giờ xoá cả gốc}
else {Cắt mối nối từ q^ tới p^}
if q^.Left = p then q^.Left := nil 
else q^.Right := nil;
Dispose(p); 
end;
Về mặt trung bình, các thao tác tìm kiếm, chèn, xoá trên cây tìm kiếm số học đều có độ phức tạp là O(log2n) còn trong trường hợp xấu nhất, độ phức tạp của các thao tác đó là O(z), bởi cây tìm kiếm số học có chiều cao không quá z + 1.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'9.7', N'Cây tìm kiếm số học (Digital Search Tree - DST)', N'..\..\public\data\C9\9_7.docx', 9, N'9.8. CÂY TÌM KIẾM CƠ SỐ (RADIX SEARCH TREE - RST)
Trong cây tìm kiếm số học, cũng như cây nhị phân tìm kiếm, phép tìm kiếm tại mỗi bước phải so sánh giá trị khoá X với giá trị lưu trong một nút của cây. Trong trường hợp các khoá có cấu trúc lớn, việc so sánh này có thể mất nhiều thời gian.
Cây tìm kiếm cơ số là một phương pháp khắc phục nhược điểm đó, nội dung của nó có thể tóm tắt như sau:
Trong cây tìm kiếm cơ số là một cây nhị phân, chỉ có nút lá chứa giá trị khoá, còn giá trị chứa trong các nút nhánh là vô nghĩa. Các nút lá của cây tìm kiếm cơ số đều nằm ở mức z + 1.
Đối với nút gốc của cây tìm kiếm cơ số, nó có tối đa hai nhánh con, mọi khoá chứa trong nút lá của nhánh con trái đều có bit cao nhất là 0, mọi khoá chứa trong nút lá của nhánh con phải đều có bit cao nhất là 1.
Đối với hai nhánh con của nút gốc, vấn đề tương tự với bit thứ z - 2, ví dụ với nhánh con trái của nút gốc, nó lại có tối đa hai nhánh con, mọi khoá chứa trong nút lá của nhánh con trái đều có bit thứ z - 2 là 0 (chúng bắt đầu bằng hai bit 00), mọi khoá chứa trong nút lá của nhánh  con phải đều có bit thứ z - 2 là 1 (chúng bắt đầu bằng hai bit 01)…
Tổng quát với nút ở mức d, nó có tối đa hai nhánh con, mọi nút lá của nhánh con trái chứa khoá có bit z - d là 0, mọi nút lá của nhánh con phải chứa khoá có bit thứ z - d là 1.
 
Cây tìm kiếm cơ số
Khác với cây nhị phân tìm kiếm hay cây tìm kiếm số học. Cây tìm kiếm cơ số được khởi tạo gồm có một nút gốc, và nút gốc tồn tại trong suốt quá trình sử dụng: nó không bao giờ bị xoá đi cả.
 
Để tìm kiếm một giá trị X trong cây tìm kiếm cơ số, ban đầu ta đứng ở nút gốc và duyệt dãy bit của X từ trái qua phải (từ bit z - 1 đến bit 0), gặp bit bằng 0 thì rẽ sang nút con trái còn gặp bit bằng 1 thì rẽ sang nút con phải, cứ tiếp tục như vậy cho tới khi một trong hai tình huống sau xảy ra:
Hoặc đi tới một nút rỗng (do rẽ theo liên kết nil) quá trình tìm kiếm thất bại do X không có trong RST
Hoặc đã duyệt hết dãy bit của X và đang đứng ở một nút lá, quá trình tìm kiếm thành công vì chắc chắn nút lá đó chứa giá trị đúng bằng X.
{Hàm tìm kiếm trên cây tìm kiếm cơ số, nó trả về nút lá chứa khoá tìm kiếm X nếu tìm thấy, trả về nil nếu không tìm thấy. z là độ dài dãy bit biểu diễn một khoá}
function RSTSearch(X: TKey): PNode; 
var
b: Integer; p: PNode;
begin
b := z; p := Root; {Bắt đầu với nút gốc, đối với RST thì gốc luôn có sẵn}
repeat
b := b - 1; {Xét bit b của X}
if <Bit b của X là 0> then p := p^.Left {Gặp 0 rẽ trái}
else p := p^.Right; {Gặp 1 rẽ phải}
until (p = nil) or (b = 0); RSTSearch := p;
end;
Thao tác chèn một giá trị X vào RST được thực hiện như sau: Đầu tiên, ta đứng ở gốc và duyệt dãy bit của X từ trái qua phải (từ bit z - 1 về bit 0), cứ gặp 0 thì rẽ trái, gặp 1 thì rẽ phải. Nếu quá trình rẽ theo một liên kết nil (đi tới nút rỗng) thì lập tức tạo ra một nút mới, và nối vào theo liên kết đó để có đường đi tiếp. Sau khi duyệt hết dãy bit của X, ta sẽ dừng lại ở một nút lá của RST, và công việc cuối cùng là đặt giá trị X vào nút lá đó.
Ví dụ:
 
Với độ dài dãy bit z = 3, cây tìm kiếm cơ số gồm các khoá 2, 4, 5 và sau khi thêm giá trị 7
{Thủ tục chèn khoá X vào cây tìm kiếm cơ số}
procedure RSTInsert(X: TKey); 
var
b: Integer; 
p, q: PNode;
begin
b := z; p := Root; {Bắt đầu từ nút gốc, đối với RST thì gốc luôn  nil}
repeat
b := b - 1; {Xét bit b của X}
q := p; {Khi p chạy xuống nút con thì q^ luôn giữ vai trò là nút cha của p^}
if <Bit b của X là 0> then p := p^.Left {Gặp 0 rẽ trái}
else p := p^.Right; {Gặp 1 rẽ phải}
if p = nil then {Không đi được thì đặt thêm nút để đi tiếp}
begin
New(p); {Tạo ra một nút mới và đem p trỏ tới nút đó}
p^.Left := nil; p^.Right := nil;
if <Bit b của X là 0> then q^.Left := p {Nối p^ vào bên trái q^}
else q^.Right := p; {Nối p^ vào bên phải q^}
end; 
until b = 0;
p^.Info := X; {p^ là nút lá để đặt X vào}
end;
Với cây tìm kiếm cơ số, việc xoá một giá trị khoá không phải chỉ là xoá riêng một nút lá mà còn phải xoá toàn bộ nhánh độc đạo đi tới nút đó để tránh lãng phí bộ nhớ.
 
RST chứa các khoá 2, 4, 5, 7 và RST sau khi loại bỏ giá trị 7
Ta lặp lại quá trình tìm kiếm giá trị khoá X, quá trình này sẽ đi từ gốc xuống lá, tại mỗi bước đi, mỗi khi gặp một nút ngã ba (nút có cả con trái và con phải - nút cấp hai), ta ghi nhận lại ngã ba đó và hướng rẽ. Kết thúc quá trình tìm kiếm ta giữ lại được ngã ba đi qua cuối cùng, từ nút đó tới nút lá chứa X là con đường độc đạo (không có chỗ rẽ), ta tiến hành dỡ bỏ tất cả các nút trên đoạn đường độc đạo khỏi cây tìm kiếm cơ số. Để không bị gặp lỗi khi cây suy biến (không có nút cấp 2) ta coi gốc cũng là nút ngã ba
{Thủ tục xoá khoá X khỏi cây tìm kiếm cơ số}
procedure RSTDelete(X: TKey); 
var
b: Integer;
p, q, TurnNode, Child: PNode; 
begin
{Trước hết, tìm kiếm giá trị X xem nó nằm ở nút nào}
b := z; p := Root; 
repeat
b := b - 1;
q := p; {Mỗi lần p chuyển sang nút con, ta luôn đảm bảo cho q^ là nút cha của p^}
if <Bit b của X là 0> then p := p^.Left 
else p := p^.Right;
if (b = z - 1) or (q^.Left  nil) and (q^.Right  nil) then {q^ là nút ngã ba}
begin
TurnNode := q; Child := p; {Ghi nhận lại q^ và hướng rẽ}
end;
until (p = nil) or (b = 0);
if p = nil then Exit; {X không tồn tại trong cây thì không xoá được}
{Trước hết, cắt nhánh độc đạo ra khỏi cây}
if TurnNode^.Left = Child then TurnNode^.Left := nil 
else TurnNode^.Right := nil
p := Child; {Chuyển sang đoạn đường độc đạo, bắt đầu xoá}
repeat
q := p;
{Lưu ý rằng p^ chỉ có tối đa một nhánh con mà thôi, cho p trỏ sang nhánh con duy nhất nếu có}
if p^.Left  nil then p := p^.Left else p := p^.Right;
Dispose(q); {Giải phóng bộ nhớ cho nút q^}
until p = nil; 
end;
Ta có một nhận xét là: Hình dáng của cây tìm kiếm cơ số không phụ thuộc vào thứ tự chèn các khoá vào mà chỉ phụ thuộc vào giá trị của các khoá chứa trong cây.
Đối với cây tìm kiếm cơ số, độ phức tạp tính toán cho các thao tác tìm kiếm, chèn, xoá trong trường hợp xấu nhất cũng như trung bình đều là O(z). Do không phải so sánh giá trị khoá dọc đường đi, nó nhanh hơn cây tìm kiếm số học nếu như gặp các khoá cấu trúc lớn. Tốc độ như vậy có thể nói là tốt, nhưng vấn đề bộ nhớ khiến ta phải xem xét: Giá trị chứa trong các nút nhánh của cây tìm kiếm cơ số là vô nghĩa dẫn tới sự lãng phí bộ nhớ.
Một giải pháp cho vấn đề này là: Duy trì hai dạng nút trên cây tìm kiếm cơ số: Dạng nút nhánh chỉ chứa các liên kết trái, phải và dạng nút lá chỉ chứa giá trị khoá. Cài đặt cây này trên một số ngôn ngữ định kiểu quá mạnh đôi khi rất khó.
Giải pháp thứ hai là đặc tả một cây tương tự như RST, nhưng sửa đổi một chút: nếu có nút lá chứa giá trị X được nối với cây bằng một nhánh độc đạo thì cắt bỏ nhánh độc đạo đó, và thay vào chỗ nhánh này chỉ một nút chứa giá trị X. Như vậy các giá trị khoá vẫn chỉ chứa trong các nút lá nhưng các nút lá giờ đây không chỉ nằm trên mức z + 1 mà còn nằm trên những mức khác nữa. Phương pháp này không những tiết kiệm bộ nhớ hơn mà còn làm cho quá trình tìm kiếm nhanh hơn. Giá phải trả cho phương pháp này là thao tác chèn, xoá khá phức tạp. Tên của cấu trúc dữ liệu này là Trie (Trie chứ không phải Tree) tìm kiếm cơ số.
 
a)
 
b)
Cây tìm kiếm cơ số a) và Trie tìm kiếm cơ số b)
Tương tự như phương pháp sắp xếp bằng cơ số, phép tìm kiếm bằng cơ số không nhất thiết phải chọn hệ cơ số 2. Ta có thể chọn hệ cơ số lớn hơn để có tốc độ nhanh hơn (kèm theo sự tốn kém bộ nhớ), chỉ lưu ý là cây tìm kiếm số học cũng như cây tìm kiếm cơ số trong trường hợp này không còn là cây nhị phân mà là cây R_phân với R là hệ cơ số được chọn.
Trong các phương pháp tìm kiếm bằng cơ số, thực ra còn một phương pháp tinh tuý và thông minh nhất, nó có cấu trúc gần giống như cây nhưng không có nút dư thừa, và quá trình duyệt bit của khoá tìm kiếm không phải từ trái qua phải mà theo thứ tự của các bit kiểm soát lưu tại mỗi nút đi qua. Phương pháp đó có tên gọi là Practical Algorithm To Retrieve Information Coded In Alphanumeric (PATRICIA) do Morrison đề xuất. Tuy nhiên, việc cài đặt phương pháp này khá phức tạp (đặc biệt là thao tác xoá giá trị khoá), ta có thể tham khảo nội dung của nó trong các tài liệu khác.

')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'9.8', N'Cây tìm kiếm cơ số (Radix Search Tree - RST)', N'..\..\public\data\C9\9_8.docx', 9, N'9.9. NHỮNG NHẬN XÉT CUỐI CÙNG
Tìm kiếm thường là công việc nhanh hơn sắp xếp nhưng lại được sử dụng nhiều hơn. Trên đây, ta đã trình bày phép tìm kiếm trong một tập hợp để tìm ra bản ghi mang khoá đúng bằng khoá tìm kiếm. Tuy nhiên, người ta có thể yêu cầu tìm bản ghi mang khoá lớn hơn hay nhỏ hơn khoá tìm kiếm, tìm bản ghi mang khoá nhỏ nhất mà lớn hơn khoá tìm kiếm, tìm bản ghi mang khoá lớn nhất mà nhỏ hơn khoá tìm kiếm v.v… Để cài đặt những thuật toán nêu trên cho những trường hợp này cần có một sự mềm dẻo nhất định.
Cũng tương tự như sắp xếp, ta không nên đánh giá giải thuật tìm kiếm này tốt hơn giải thuật tìm kiếm khác. Sử dụng thuật toán tìm kiếm phù hợp với từng yêu cầu cụ thể là kỹ năng của người lập trình, việc cài đặt cây nhị phân tìm kiếm hay cây tìm kiếm cơ số chỉ để tìm kiếm trên vài chục bản ghi chỉ khẳng định được một điều rõ ràng: không biết thế nào là giải thuật và lập trình.
')
GO
INSERT [dbo].[baihoc] ([baiso], [tenbai], [duongdan], [chuongso], [noidung]) VALUES (N'9.9', N'Những nhận xét cuối cùng', N'..\..\public\data\C9\9_9.docx', 9, N'Bài tập
Bài 1
Hãy thử viết một chương trình SearchDemo tương tự như chương trình SortDemo trong bài trước. Đồng thời viết thêm vào chương trình SortDemo ở bài trước thủ tục TreeSort và đánh giá tốc độ thực của nó.
Bài 2
Tìm hiểu các phương pháp tìm kiếm ngoài, cấu trúc của các B_cây 
Bài 3
Tìm hiểu các phương pháp tìm kiếm chuỗi, thuật toán BRUTE-FORCE, thuật toán KNUTH- MORRIS-PRATT, thuật toán BOYER-MOORE và thuật toán RABIN-KARP
Tuy gọi là chuyên đề về "Cấu trúc dữ liệu và giải thuật" nhưng thực ra, ta mới chỉ tìm hiểu qua về hai dạng cấu trúc dữ liệu hay gặp là danh sách và cây, cùng với một số thuật toán mà "đâu cũng phải có" là tìm kiếm và sắp xếp. Không một tài liệu nào có thể đề cập tới mọi cấu trúc dữ liệu và giải thuật bởi chúng quá phong phú và liên tục được bổ sung. Những cấu trúc dữ liệu và giải thuật không "phổ thông" lắm như lý thuyết đồ thị, hình học, v.v… sẽ được tách ra và sẽ được nói kỹ hơn trong một chuyên đề khác.
Việc đi sâu nghiên cứu những cấu trúc dữ liệu và giải thuật, dù chỉ là một phần nhỏ hẹp cũng nảy sinh rất nhiều vấn đề hay và khó, như các vấn đề lý thuyết về độ phức tạp tính toán, vấn đề NP_đầy đủ v.v… Đó là công việc của những nhà khoa học máy tính. Nhưng trước khi trở thành một nhà khoa học máy tính thì điều kiện cần là phải biết lập trình. Vậy nên khi tìm hiểu bất cứ cấu trúc dữ liệu hay giải thuật nào, nhất thiết ta phải cố gắng cài đặt bằng được. Mọi ý tưởng hay sẽ chỉ là bỏ đi nếu như không biến thành hiệu quả, thực tế là như vậy.
')
GO
INSERT [dbo].[chuong] ([chuongso], [tenchuong]) VALUES (1, N'Các bước cơ bản khi tiến hành giải các bài toán tin học')
GO
INSERT [dbo].[chuong] ([chuongso], [tenchuong]) VALUES (2, N'Phân tích thời gian thực hiện giải thuật')
GO
INSERT [dbo].[chuong] ([chuongso], [tenchuong]) VALUES (3, N'Đệ quy và giải thuật đệ quy')
GO
INSERT [dbo].[chuong] ([chuongso], [tenchuong]) VALUES (4, N'Cấu trúc dữ liệu biểu diễn danh sách')
GO
INSERT [dbo].[chuong] ([chuongso], [tenchuong]) VALUES (5, N'Ngăn xếp và hàng đợi')
GO
INSERT [dbo].[chuong] ([chuongso], [tenchuong]) VALUES (6, N'Cây (Tree)')
GO
INSERT [dbo].[chuong] ([chuongso], [tenchuong]) VALUES (7, N'Ký pháp tiền tố, trung tố, hậu tố')
GO
INSERT [dbo].[chuong] ([chuongso], [tenchuong]) VALUES (8, N'Sắp xếp (Sorting)')
GO
INSERT [dbo].[chuong] ([chuongso], [tenchuong]) VALUES (9, N'Tìm kiếm (Searching)')
GO
INSERT [dbo].[loainoidung] ([maloai], [tenloai]) VALUES (N'T01', N'Khái niệm')
GO
INSERT [dbo].[loainoidung] ([maloai], [tenloai]) VALUES (N'T02', N'Hàm')
GO
INSERT [dbo].[loainoidung] ([maloai], [tenloai]) VALUES (N'T03', N'Thủ tục')
GO
INSERT [dbo].[loainoidung] ([maloai], [tenloai]) VALUES (N'T04', N'Đoạn chương trình')
GO
INSERT [dbo].[loainoidung] ([maloai], [tenloai]) VALUES (N'T05', N'Bài tập')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000001', N'Thủ tục tính tổng từ 1 đến n')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000002', N'Đoạn chương trình tính tổng các hạng tử')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000003', N'Thủ tục in cách biểu diễn số X bằng cách đệ quy')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000004', N'Đoạn chương trình cài đặt stack')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000005', N'Đoạn chương trình cài đặt queue')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000006', N'Thủ tục duyệt cây nhị phân')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000007', N'Biểu thức RPN')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000008', N'Cây nhị phân tìm kiếm')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000009', N'Cây tìm kiếm số học')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000010', N'Cây tìm kiếm cơ số')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000011', N'Thủ tục sắp xếp nhanh')
GO
INSERT [dbo].[nhan] ([manhan], [tennhan]) VALUES (N'0000000012', N'Thủ tục sắp xếp cơ số')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000001', N'ND00023')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000001', N'ND00024')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000002', N'ND00025')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000002', N'ND00026')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000003', N'ND00027')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000003', N'ND00028')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000004', N'ND00032')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000004', N'ND00033')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000005', N'ND00034')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000005', N'ND00035')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000005', N'ND00036')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000006', N'ND00037')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000006', N'ND00038')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000006', N'ND00039')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000007', N'ND00041')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000007', N'ND00042')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000008', N'ND00046')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000008', N'ND00058')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000008', N'ND00059')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000009', N'ND00060')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000009', N'ND00061')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000009', N'ND00062')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000010', N'ND00063')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000010', N'ND00064')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000010', N'ND00065')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000011', N'ND00048')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000011', N'ND00049')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000012', N'ND00052')
GO
INSERT [dbo].[noidungbai_nhan] ([manhan], [mand]) VALUES (N'0000000012', N'ND00053')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00001', N'Thuật toán. Thuật toán là một hệ thống chặt chẽ và rõ ràng các quy tắc nhằm xác định một dãy thao tác trên cấu trúc dữ liệu sao cho: Với một bộ dữ liệu vào, sau một số hữu hạn bước thực hiện các thao tác đã chỉ ra, ta đạt được mục tiêu đã định.', 1, 1, N'T01', N'1.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00002', N'Đệ quy.Ta nói một đối tượng là đệ quy nếu nó được định nghĩa qua chính nó hoặc một đối tượng khác cùng dạng với chính nó bằng quy nạp.
Ví dụ: Đặt hai chiếc gương cầu đối diện nhau. Trong chiếc gương thứ nhất chứa hình chiếc gương thứ hai. Chiếc gương thứ hai lại chứa hình chiếc gương thứ nhất nên tất nhiên nó chứa lại hình ảnh của chính nó trong chiếc gương thứ nhất… Ở một góc nhìn hợp lý, ta có thể thấy một dãy ảnh vô hạn của cả hai chiếc gương.
Một ví dụ khác là nếu người ta phát hình trực tiếp phát thanh viên ngồi bên máy vô tuyến truyền hình, trên màn hình của máy này lại có chính hình ảnh của phát thanh viên đó ngồi bên máy vô tuyến truyền hình và cứ như thế…
Trong toán học, ta cũng hay gặp các định nghĩa đệ quy:
Giai thừa của n (n!): Nếu n = 0 thì n! = 1; nếu n > 0 thì n! = n.(n-1)!
Ký hiệu số phần tử của một tập hợp hữu hạn S là |S|: Nếu S = Æ thì |S| = 0; Nếu S ¹ Æ thì tất có một phần tử x Î S, khi đó |S| = |S\{x}| + 1. Đây là phương pháp định nghĩa tập các số tự nhiên.', 1, -1, N'T01', N'3.1')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00003', N'Danh sách. Danh sách là một tập sắp thứ tự các phần tử cùng một kiểu. Đối với danh sách, người ta có một số thao tác: Tìm một phần tử trong danh sách, chèn một phần tử vào danh sách, xoá một phần tử khỏi danh sách, sắp xếp lại các phần tử trong danh sách theo một trật tự nào đó v.v…', 1, -1, N'T01', N'4.1')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00004', N'Mảng. Khi cài đặt danh sách bằng một mảng, thì có một biến nguyên n lưu số phần tử hiện có trong danh sách. Nếu mảng được đánh số bắt đầu từ 1 thì các phần tử trong danh sách được cất giữ trong mảng bằng các phần tử được đánh số từ 1 tới n. 
Chèn phần tử vào mảng:
Mảng ban đầu:
Image
Nếu muốn chèn một phần tử V vào mảng tại vị trí p, ta phải: 
Dồn tất cả các phần tử từ vị trí p tới tới vị trí n về sau một vị trí:
Image
Đặt giá trị V vào vị trí p:
Image
Tăng n lên 1
Xoá phần tử khỏi mảng:
Mảng ban đầu:
Image
Muốn xoá phần tử thứ p của mảng mà vẫn giữ nguyên thứ tự các phần tử còn lại, ta phải: Dồn tất cả các phần tử từ vị trí p + 1 tới vị trí n lên trước một vị trí:
Image
Giảm n đi 1
Image
Trong trường hợp cần xóa một phần tử mà không cần duy trì thứ tự của các phần tử khác, ta chỉ cần đảo giá trị của phần tử cần xóa cho phần tử cuối cùng rồi giảm số phần tử của mảng (n) đi 1.', 3, 20, N'T01', N'4.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00005', N'Danh sách liên kết đơn. Danh sách liên kết đơn gồm các nút được nối với nhau theo một chiều. Mỗi nút là một bản ghi (record) gồm hai trường:
Trường thứ nhất chứa giá trị lưu trong nút đó
Trường thứ hai chứa liên kết (con trỏ) tới nút kế tiếp, tức là chứa một thông tin đủ để biết nút kế tiếp nút đó trong danh sách là nút nào, trong trường hợp là nút cuối cùng (không có nút kế tiếp), trường liên kết này được gán một giá trị đặc biệt.
Image
Cấu trúc nút của danh sách liên kết đơn
Nút đầu tiên trong danh sách được gọi là chốt của danh sách liên kết đơn (Head). Để duyệt danh sách liên kết đơn, ta bắt đầu từ chốt, dựa vào trường liên kết để đi sang nút kế tiếp, đến khi gặp giá trị đặc biệt (duyệt qua nút cuối) thì dừng lại
Image
Danh sách liên kết đơn
Chèn phần tử vào danh sách liên kết đơn:
Danh sách ban đầu:
Image
Muốn chèn thêm một nút chứa giá trị V vào vị trí của nút p, ta phải:
a) Tạo ra một nút mới NewNode chứa giá trị V:
Image
b) Tìm nút q là nút đứng trước nút p trong danh sách (nút có liên kết tới p).
     b1) Nếu tìm thấy thì chỉnh lại liên kết: q liên kết tới NewNode, NewNode liên kết tới p
Image
     b2) Nếu không có nút đứng trước nút p trong danh sách thì tức là p = Head, ta chỉnh lại liên kết: NewNode liên kết tới Head (cũ) và đặt lại Head = NewNode
Xoá phần tử khỏi danh sách liên kết đơn:
Danh sách ban đầu:
Image
Muốn huỷ nút p khỏi danh sách liên kết đơn, ta phải:
Tìm nút q là nút đứng liền trước nút p trong danh sách (nút có liên kết tới p)
Nếu tìm thấy thì chỉnh lại liên kết: q liên kết thẳng tới nút liền sau p, khi đó quá trình duyệt danh sách bắt đầu từ Head khi duyệt tới q sẽ nhảy qua không duyệt p nữa. Trên thực tế khi cài đặt bằng các biến động và con trỏ, ta nên có thao tác giải phóng bộ nhớ đã cấp cho nút p
Image', 22, 46, N'T01', N'4.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00006', N'Danh sách liên kết đôi. Danh sách liên kết đôi gồm các nút được nối với nhau theo hai chiều. Mỗi nút là một bản ghi (record) gồm ba trường:48
⦁	Trường thứ nhất chứa giá trị lưu trong nút đó
⦁	Trường thứ hai (Next) chứa liên kết (con trỏ) tới nút kế tiếp, tức là chứa một thông tin đủ để biết nút kế tiếp nút đó là nút nào, trong trường hợp là nút cuối cùng (không có nút kế tiếp), trường liên kết này được gán một giá tị đặc biệt.
⦁	Trường thứ ba (Prev) chứa liên kết (con trỏ) tới nút liền trước, tức là chứa một thông tin đủ để biết nút đứng trước nút đó trong danh sách là nút nào, trong trường hợp là  nút đầu tiên (không có nút liền trước) trường này được gán một giá trị đặc biệt.
Image
Cấu trúc nút của danh sách liên kết đôi
Khác với danh sách liên kết đơn, danh sách liên kết đôi có hai chốt: Nút đầu tiên trong danh sách được gọi là First, nút cuối cùng trong danh sách được gọi là Last. Để duyệt danh sách liên kết đôi, ta có hai cách: Hoặc bắt đầu từ First, dựa vào liên kết Next để đi sang nút kế tiếp, đến khi gặp giá trị đặc biệt (duyệt qua nút cuối) thì dừng lại. Hoặc bắt đầu từ Last, dựa vào liên kết Prev để đi sang nút liền trước, đến khi gặp giá trị đặc biệt (duyệt qua nút đầu) thì dừng lại
Image
Danh sách liên kết đôi
Việc chèn / xoá vào danh sách liên kết đôi cũng đơn giản chỉ là kỹ thuật chỉnh lại các mối liên kết giữa các nút cho hợp lý, ta coi như bài tập.
4.2.4.	Cài đặt bằng danh sách liên kết vòng một hướng
Trong danh sách liên kết đơn, phần tử cuối cùng trong danh sách có trường liên kết được gán một giá trị đặc biệt (thường sử dụng nhất là giá trị nil). Nếu ta cho trường liên kết của phần tử cuối cùng trỏ thẳng về phần tử đầu tiên của danh sách thì ta sẽ được một kiểu danh sách mới gọi là danh sách liên kết vòng một hướng.', 49, 60, N'T01', N'4.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00007', N'Danh sách liên kết vòng một hướng. Trong danh sách liên kết đơn, phần tử cuối cùng trong danh sách có trường liên kết được gán một giá trị đặc biệt (thường sử dụng nhất là giá trị nil). Nếu ta cho trường liên kết của phần tử cuối cùng trỏ thẳng về phần tử đầu tiên của danh sách thì ta sẽ được một kiểu danh sách mới gọi là danh sách liên kết vòng một hướng.
Image
Danh sách liên kết vòng một hướng
Đối với danh sách liên kết vòng, ta chỉ cần biết một nút bất kỳ của danh sách là ta có thể duyệt được hết các nút trong danh sách bằng cách đi theo hướng của các liên kết. Chính vì lý do này, khi chèn xoá vào danh sách liên kết vòng, ta không phải xử lý các trường hợp riêng khi chèn xoá tại vị trí của chốt', 60, 63, N'T01', N'4.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00008', N'Danh sách liên kết vòng hai hướng. Danh sách liên kết vòng một hướng chỉ cho ta duyệt các nút của danh sách theo một chiều, nếu cài đặt bằng danh sách liên kết vòng hai hướng thì ta có thể duyệt các nút của danh sách cả theo chiều ngược lại nữa. Danh sách liên kết vòng hai hướng có thể tạo thành từ danh sách liên kết đôi nếu ta cho trường Prev của nút First trỏ thẳng tới nút Last còn trường Next của nút Last thì trỏ thẳng về nút First.
Image
Danh sách liên kết vòng hai hướng', 65, 67, N'T01', N'4.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00009', N'Ngăn xếp. Ngăn xếp là một kiểu danh sách được trang bị hai phép toán bổ sung một phần tử vào cuối danh sách và loại bỏ một phần tử cũng ở cuối danh sách.
Có thể hình dung ngăn xếp như hình ảnh một chồng đĩa, đĩa nào được đặt vào chồng sau cùng sẽ nằm trên tất cả các đĩa khác và sẽ được lấy ra đầu tiên. Vì nguyên tắc"vào sau ra trước" đó, Stack còn có tên gọi là danh sách kiểu LIFO (Last In First Out) và vị trí cuối danh sách được gọi là đỉnh (Top) của Stack.', 1, 2, N'T01', N'5.1')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00010', N'Hàng đợi. Hàng đợi là một kiểu danh sách được trang bị hai phép toán bổ sung một phần tử vào cuối danh sách (Rear) và loại bỏ một phần tử ở đầu danh sách (Front).
Có thể hình dung hàng đợi như một đoàn người xếp hàng mua vé: Người nào xếp hàng trước sẽ được mua vé trước. Vì nguyên tắc"vào trước ra trước" đó, Queue còn có tên gọi là danh sách kiểu FIFO (First In First Out).', 1, 2, N'T01', N'5.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00011', N'Cây. Cấu trúc dữ liệu trừu tượng ta quan tâm tới trong mục này là cấu trúc cây. Cây là một cấu trúc dữ liệu gồm một tập hữu hạn các nút, giữa các nút có một quan hệ phân cấp gọi là quan hệ "cha - con". Có một nút đặc biệt gọi là gốc (root).
Có thể định nghĩa cây bằng các đệ quy như sau:
⦁	Mỗi nút là một cây, nút đó cũng là gốc của cây ấy
⦁	Nếu n là một nút và n1, n2, …, nk lần lượt là gốc của các cây T1, T2, …, Tk; các cây   này đôi một không có nút chung. Thì nếu cho nút n trở thành cha của các nút n1, n2, …, nk ta sẽ được một cây mới T. Cây này có nút n là gốc còn các cây T1, T2, …, Tk trở thành các cây con (subtree) của gốc.
Để tiện, người ta còn cho phép tồn tại một cây không có nút nào mà ta gọi là cây rỗng (null tree).
Xét cây:
Image
Cây
A là cha của B, C, D, còn G, H, I là con của D
Số các con của một nút được gọi là cấp của nút đó, ví dụ cấp của A là 3, cấp của B là 2, cấp của C là 0.
Nút có cấp bằng 0 được gọi là nút lá (leaf) hay nút tận cùng. Ví dụ như ở trên, các nút E, F, C, G, J, K và I là các nút là. Những nút không phải là lá được gọi là nút nhánh (branch)
Cấp cao nhất của một nút trên cây gọi là cấp của cây đó, cây ở hình trên là cây cấp 3.
Gốc của cây người ta gán cho số mức là 1, nếu nút cha có mức là i thì nút con sẽ có mức là i + 1.  Mức của cây trong hình trên được chỉ ra trong hình dưới đây:
Image
Mức của các nút trên cây
Chiều cao (height) hay chiều sâu (depth) của một cây là số mức lớn nhất của nút có trên cây đó. Cây ở trên có chiều cao là 4
Một tập hợp các cây phân biệt được gọi là rừng (forest), một cây cũng là một rừng. Nếu bỏ nút gốc trên cây thì sẽ tạo thành một rừng các cây con.
Ví dụ:
⦁	Mục lục của một cuốn sách với phần, chương, bài, mục v.v… có cấu trúc của cây
⦁	Cấu trúc thư mục trên đĩa cũng có cấu trúc cây, thư mục gốc có thể coi là gốc của cây
⦁	đó với các cây con là các thư mục con và tệp nằm trên thư mục gốc.
⦁	Gia phả của một họ tộc cũng có cấu trúc cây.
⦁	Một biểu thức số học gồm các phép toán cộng, trừ, nhân, chia cũng có thể lưu trữ trong một cây mà các toán hạng được lưu trữ ở các nút lá, các toán tử được lưu trữ ở các nút nhánh, mỗi nhánh là một biểu thức con.
Image
Cây biểu diễn biểu thức', 1, -1, N'T01', N'6.1')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00012', N'Cây nhị phân. Cây nhị phân là một dạng quan trọng của cấu trúc cây. Nó có đặc điểm là mọi nút trên cây chỉ có tối đa hai nhánh con. Với một nút thì người ta cũng phân biệt cây con trái và cây con phải của nút đó. Cây nhị phân là cây có tính đến thứ tự của các nhánh con.
Cần chú ý tới một số dạng đặc biệt của cây nhị phân
Các cây nhị phân dưới đây được gọi là cây nhị phân suy biến (degenerate binary tree), các nút không phải là lá chỉ có một nhánh con. Cây a) được gọi là cây lệch phải, cây b) được gọi là cây lệch trái, cây c) và d) được gọi là cây zíc-zắc.
Image
Các dạng cây nhị phân suy biến
Các cây trong hình dưới đây được gọi là cây nhị phân hoàn chỉnh (complete binary tree): Nếu chiều cao của cây là h thì mọi nút có mức < h - 1 đều có đúng 2 nút con. Còn nếu mọi nút có mức £ h - 1 đều có đúng 2 nút con như trường hợp cây f) ở trên thì cây đó được gọi là cây nhị phân đầy đủ (full binary tree). Cây nhị phân đầy đủ là trường hợp riêng của cây nhị phân hoàn chỉnh.
Image
Cây nhị phân hoàn chỉnh và cây nhị phân đầy đủ
Ta có thể thấy ngay những tính chất sau bằng phép chứng minh quy nạp:
Trong các cây nhị phân có cùng số lượng nút như nhau thì cây nhị phân suy biến có chiều cao lớn nhất, còn cây nhị phân hoàn chỉnh thì có chiều cao nhỏ nhất.
Số lượng tối đa các nút trên mức i của cây nhị phân là 2i-1, tối thiểu là 1 (i ³ 1).
Số lượng tối đa các nút trên một cây nhị phân có chiều cao h là 2h-1, tối thiểu là h (h ³ 1). Cây nhị phân hoàn chỉnh, không đầy đủ, có n nút thì chiều cao của nó là h = [log2(n + 1)] + 1.
Cây nhị phân đầy đủ có n nút thì chiều cao của nó là h = log2(n + 1)', 1, -1, N'T01', N'6.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00013', N'Cây K_phân. Cây K_phân là một dạng cấu trúc cây mà mỗi nút trên cây có tối đa K nút con (có tính đến  thứ tự của các nút con).', 1, 1, N'T01', N'6.5')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00014', N'Cây tổng quát. Trong thực tế, có một số ứng dụng đòi hỏi một cấu trúc dữ liệu dạng cây nhưng không có ràng buộc gì về số con của một nút trên cây, ví dụ như cấu trúc thư mục trên đĩa hay hệ thống đề mục của một cuốn sách. Khi đó, ta phải tìm cách mô tả một cách khoa học cấu trúc dữ liệu dạng cây tổng quát. Cũng như trường hợp cây nhị phân, người ta thường biểu diễn cây tổng quát bằng hai cách: Lưu trữ kế tiếp bằng mảng và lưu trữ bằng cấu trúc liên kết.', 1, 1, N'T01', N'6.6')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00015', N'Sắp xếp. BÀI TOÁN SẮP XẾP
Sắp xếp là quá trình bố trí lại các phần tử của một tập đối tượng nào đó theo một thứ tự nhất định. Chẳng hạn như thứ tự tăng dần (hay giảm dần) đối với một dãy số, thứ tự từ điển đối với các từ v.v… Yêu cầu về sắp xếp thường xuyên xuất hiện trong các ứng dụng Tin học với các mục đích khác nhau: sắp xếp dữ liệu trong máy tính để tìm kiếm cho thuận lợi, sắp xếp các kết quả xử lý để in ra trên bảng biểu v.v…
Nói chung, dữ liệu có thể xuất hiện dưới nhiều dạng khác nhau, nhưng ở đây ta quy ước: Một tập các đối tượng cần sắp xếp là tập các bản ghi (records), mỗi bản ghi bao gồm một số trường (fields) khác nhau. Nhưng không phải toàn bộ các trường dữ liệu trong bản ghi đều được xem xét đến trong quá trình sắp xếp mà chỉ là một trường nào đó (hay một vài trường nào đó) được chú ý tới thôi. Trường như vậy ta gọi là khoá (key). Sắp xếp sẽ được tiến hành dựa vào giá trị của khoá này.
Ví dụ: Hồ sơ tuyển sinh của một trường Đại học là một danh sách thí sinh, mỗi thí sinh có tên, số báo danh, điểm thi. Khi muốn liệt kê danh sách những thí sinh trúng tuyển tức là phải sắp xếp các thí sinh theo thứ tự từ điểm cao nhất tới điểm thấp nhất. Ở đây khoá sắp xếp chính là điểm thi.
STT	SBD	Họ và tên	Điểm thi
1	A100	Nguyễn Văn A	20
2	B200	Trần Thị B	25
3	X150	Phạm Văn C	18
', 1, 20, N'T01', N'8.1')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00016', N'QuickSort. Sắp xếp nhanh (QuickSort) là một phương pháp sắp xếp tốt nhất, nghĩa là dù dãy khoá thuộc kiểu dữ liệu có thứ tự nào, QuickSort cũng có thể sắp xếp được và không có một thuật toán sắp xếp nào nhanh hơn QuickSort về mặt tốc độ trung bình (theo tôi biết). Người sáng lập ra nó là C.A.R. Hoare đã mạnh dạn đặt tên cho nó là sắp xếp "NHANH".', 2, 2, N'T01', N'8.6')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00017', N'Đống. Đống là một dạng cây nhị phân hoàn chỉnh đặc biệt mà giá trị lưu tại mọi nút nhánh đều lớn hơn hay bằng giá trị lưu trong hai nút con của nó.
 
Image
Heap', 2, 5, N'T01', N'8.7')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00018', N'Vun đống. Trong bài học về cây, ta đã biết một dãy khoá k1, k2, …, kn là biểu diễn của một cây nhị phân hoàn chỉnh mà ki là giá trị lưu trong nút thứ i, nút con của nút thứ i là nút 2i và nút 2i + 1, nút cha của nút thứ j là nút j div 2. Vấn đề đặt ra là sắp lại dãy khoá đã cho để nó biểu diễn một đống.
Vì cây nhị phân chỉ gồm có một nút hiển nhiên là đống, nên để vun một nhánh cây gốc r thành đống, ta có thể coi hai nhánh con của nó (nhánh gốc 2r và 2r + 1) đã là đống rồi và thực hiện thuật toán vun đống từ dưới lên (bottom-up) đối với cây: Gọi h là chiều cao của cây, nút ở mức h (nút lá) đã là gốc một đống, ta vun lên để những nút ở mức h - 1 cũng là gốc của đống, … cứ như vậy cho tới nút ở mức 1 (nút gốc) cũng là gốc của đống.
Thuật toán vun thành đống đối với cây gốc r, hai nhánh con của r đã là đống rồi:
Giả sử ở nút r chứa giá trị V. Từ r, ta cứ đi tới nút con chứa giá trị lớn nhất trong 2 nút con, cho tới khi gặp phải một nút c mà mọi nút con của c đều chứa giá trị £ V (nút lá cũng là trường hợp riêng của điều kiện này). Dọc trên đường đi từ r tới c, ta đẩy giá trị chứa ở nút con lên nút cha và đặt giá trị V vào nút c.
Image
Vun đống', 7, 12, N'T01', N'8.7')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00019', N'Phép trộn 2 đường. Phép trộn 2 đường là phép hợp nhất hai dãy khoá đã sắp xếp để ghép lại thành một dãy khoá có kích thước bằng tổng kích thước của hai dãy khoá ban đầu và dãy khoá tạo thành cũng có thứ tự sắp xếp. Nguyên tắc thực hiện của nó khá đơn giản: so sánh hai khoá đứng đầu hai dãy, chọn ra khoá nhỏ nhất và đưa nó vào miền sắp xếp (một dãy khoá phụ có kích thước bằng tổng kích thước hai dãy khoá ban đầu) ở vị trí thích hợp. Sau đó, khoá này bị loại ra khỏi dãy khoá chứa nó. Quá trình tiếp tục cho tới khi một trong hai dãy khoá đã cạn, khi đó chỉ cần chuyển toàn bộ dãy khoá còn lại ra miền sắp xếp là xong.', 2, 2, N'T01', N'8.11')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00020', N'Phép băm. Tư tưởng của phép băm là dựa vào giá trị các khoá k1, k2, …, kn, chia các khoá đó ra thành các nhóm. Những khoá thuộc cùng một nhóm có một đặc điểm chung và đặc điểm này không có trong các nhóm khác. Khi có một khoá tìm kiếm X, trước hết ta xác định xem nếu X thuộc vào dãy khoá đã cho thì nó phải thuộc nhóm nào và tiến hành tìm kiếm trên nhóm đó.
Một ví dụ là trong cuốn từ điển, các bạn sinh viên thường dán vào 26 mảnh giấy nhỏ vào các trang để đánh dấu trang nào là trang khởi đầu của một đoạn chứa các từ có cùng chữ cái đầu. Để khi tra từ chỉ cần tìm trong các trang chứa những từ có cùng chữ cái đầu với từ cần tìm.
Image
Một ví dụ khác là trên dãy các khoá số tự nhiên, ta có thể chia nó là làm m nhóm, mỗi nhóm gồm các khoá đồng dư theo mô-đun m.
Có nhiều cách cài đặt phép băm:
Cách thứ nhất là chia dãy khoá làm các đoạn, mỗi đoạn chứa những khoá thuộc cùng một nhóm và ghi nhận lại vị trí các đoạn đó. Để khi có khoá tìm kiếm, có thể xác định được ngay cần phải tìm khoá đó trong đoạn nào.
Cách thứ hai là chia dãy khoá làm m nhóm, Mỗi nhóm là một danh sách nối đơn chứa các giá trị khoá và ghi nhận lại chốt của mỗi danh sách nối đơn. Với một khoá tìm kiếm, ta xác định được phải tìm khoá đó trong danh sách nối đơn nào và tiến hành tìm kiếm tuần tự trên danh sách nối đơn đó. Với cách lưu trữ này, việc bổ sung cũng như loại bỏ một giá trị khỏi tập hợp khoá dễ dàng hơn rất nhiều phương pháp trên.
Cách thứ ba là nếu chia dãy khoá làm m nhóm, mỗi nhóm được lưu trữ dưới dạng cây nhị phân tìm kiếm và ghi nhận lại gốc của các cây nhị phân tìm kiếm đó, phương pháp này có thể nói là tốt hơn hai phương pháp trên, tuy nhiên dãy khoá phải có quan hệ thứ tự toàn phần thì mới làm được.', 1, -1, N'T01', N'9.5')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00021', N'Khoá số với bài toán tìm kiếm. Mọi dữ liệu lưu trữ trong máy tính đều được số hoá, tức là đều được lưu trữ bằng các đơn vị Bit, Byte, Word v.v… Điều đó có nghĩa là một giá trị khoá bất kỳ, ta hoàn toàn có thể biết được nó được mã hoá bằng con số như thế nào. Và một điều chắc chắn là hai khoá khác nhau sẽ được lưu trữ bằng hai số khác nhau.
Đối với bài toán sắp xếp, ta không thể đưa việc sắp xếp một dãy khoá bất kỳ về việc sắp xếp trên một dãy khoá số là mã của các khoá. Bởi quan hệ thứ tự trên các con số đó có thể khác với thứ tự cần sắp của các khoá.
Nhưng đối với bài toán tìm kiếm thì khác, với một khoá tìm kiếm, Câu trả lời hoặc là "Không tìm thấy" hoặc là "Có tìm thấy và ở chỗ …" nên ta hoàn toàn có thể thay các khoá bằng các mã số của nó mà không bị sai lầm, chỉ lưu ý một điều là: hai khoá khác nhau phải mã hoá thành hai số khác nhau mà thôi.
Nói như vậy có nghĩa là việc nghiên cứu những thuật toán tìm kiếm trên các dãy khoá số rất quan trọng, và dưới đây ta sẽ trình bày một số phương pháp đó.', 1, -1, N'T01', N'9.6')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00022', N'Cây tìm kiếm cơ số. Trong cây tìm kiếm số học, cũng như cây nhị phân tìm kiếm, phép tìm kiếm tại mỗi bước phải so sánh giá trị khoá X với giá trị lưu trong một nút của cây. Trong trường hợp các khoá có cấu trúc lớn, việc so sánh này có thể mất nhiều thời gian.
Cây tìm kiếm cơ số là một phương pháp khắc phục nhược điểm đó, nội dung của nó có thể tóm tắt như sau:
Trong cây tìm kiếm cơ số là một cây nhị phân, chỉ có nút lá chứa giá trị khoá, còn giá trị chứa trong các nút nhánh là vô nghĩa. Các nút lá của cây tìm kiếm cơ số đều nằm ở mức z + 1.
Đối với nút gốc của cây tìm kiếm cơ số, nó có tối đa hai nhánh con, mọi khoá chứa trong nút lá của nhánh con trái đều có bit cao nhất là 0, mọi khoá chứa trong nút lá của nhánh con phải đều có bit cao nhất là 1.
Đối với hai nhánh con của nút gốc, vấn đề tương tự với bit thứ z - 2, ví dụ với nhánh con trái của nút gốc, nó lại có tối đa hai nhánh con, mọi khoá chứa trong nút lá của nhánh con trái đều có bit thứ z - 2 là 0 (chúng bắt đầu bằng hai bit 00), mọi khoá chứa trong nút lá của nhánh  con phải đều có bit thứ z - 2 là 1 (chúng bắt đầu bằng hai bit 01)…
Tổng quát với nút ở mức d, nó có tối đa hai nhánh con, mọi nút lá của nhánh con trái chứa khoá có bit z - d là 0, mọi nút lá của nhánh con phải chứa khoá có bit thứ z - d là 1.
Image
Cây tìm kiếm cơ số
Khác với cây nhị phân tìm kiếm hay cây tìm kiếm số học. Cây tìm kiếm cơ số được khởi tạo gồm có một nút gốc, và nút gốc tồn tại trong suốt quá trình sử dụng: nó không bao giờ bị xoá đi cả.
 
Để tìm kiếm một giá trị X trong cây tìm kiếm cơ số, ban đầu ta đứng ở nút gốc và duyệt dãy bit của X từ trái qua phải (từ bit z - 1 đến bit 0), gặp bit bằng 0 thì rẽ sang nút con trái còn gặp bit bằng 1 thì rẽ sang nút con phải, cứ tiếp tục như vậy cho tới khi một trong hai tình huống sau xảy ra:
Hoặc đi tới một nút rỗng (do rẽ theo liên kết nil) quá trình tìm kiếm thất bại do X không có trong RST
Hoặc đã duyệt hết dãy bit của X và đang đứng ở một nút lá, quá trình tìm kiếm thành công vì chắc chắn nút lá đó chứa giá trị đúng bằng X.', 1, 13, N'T01', N'9.8')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00023', N'Thủ tục tính tổng từ 1 đến n với độ phức tạp O(n). Input n;
S := 0;
for  i := 1 to n do S := S + i;
Output S;', 32, 35, N'T03', N'2.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00024', N'Thủ tục tính tổng từ 1 đến n với độ phức tạp O(1). Input n;
S := n * (n - 1) div 2; Output S;', 39, 40, N'T03', N'2.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00025', N'Đoạn chương trình tính riêng từng hạng tử rồi cộng lại. program Exp1;
var
i, j, n: Integer; x, p, S: Real; 
begin
Write(''x, n = ''); ReadLn(x, n); S := 0;
for i := 0 to n do 
begin
p := 1;
for j := 1 to i do p := p * x / j; 
S := S + p;
end;
WriteLn(''exp('', x:1:4, '') = '', S:1:4);
end.', 47, 59, N'T04', N'2.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00026', N'Đoạn chương trình tính hạng tử sau qua hạng tử trước. program Exp2;
var
i, n: Integer;
x, p, S: Real;
begin
Write(''x, n = ''); ReadLn(x, n);
S := 1; 
p := 1;
for i := 1 to n do 
begin
p := p * x / i;
S := S + p;
end;
WriteLn(''exp('', x:1:4, '') = '', S:1:4);
end.', 64, 78, N'T04', N'2.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00027', N'Thủ tục in cách biểu diễn số X bằng cách đệ quy trực tiếp. procedure Solve(X: Integer); {In ra cách biểu diễn số X} 
begin
if X = 1 then Write(X) 
else 
if X mod 2 = 0 then 
begin
Solve(X div 2); 
Write('' * 2''); 
end
else 
begin
Solve(X * 3 + 1); 
Write('' div 3''); 
end;
end; ', 48, 62, N'T03', N'3.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00028', N'Thủ tục in cách biểu diễn số X bằng cách đệ quy tương hỗ. procedure Solve(X: Integer); forward;

procedure SolveOdd(X: Integer); 
begin
Solve(X * 3 + 1);
Write('' div 3''); 
end;

procedure SolveEven(X: Integer); 
begin
Solve(X div 2);
Write('' * 2''); 
end;

procedure Solve(X: Integer); 
begin
if X = 1 then Write(X) 
else
if X mod 2 = 1 then SolveOdd(X) 
else SolveEven(X);
end;', 64, 84, N'T03', N'3.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00029', N'Thủ tục bài toán tháp Hà Nội. procedure Move(n, x, y: Integer); 
begin
if n = 1 then WriteLn(''Chuyển 1 đĩa từ '', x, '' sang '', y)
else
begin
Move(n - 1, x, 6 - x - y);
Move(1, x, y); {Chuyển đĩa to nhất từ x sang y}
Move(n - 1, 6 - x - y, y); 
end;
end;', 107, 116, N'T03', N'3.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00030', N'Hàm tính giai thừa. function Factorial(n: Integer): Integer; 
begin
if n = 0 then Factorial := 1 
else Factorial := n * Factorial(n - 1);
end;', 2, 6, N'T02', N'3.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00031', N'Hàm tính Fibonacci. function F(n: Integer): Integer; 
begin
if n £ 2 then F := 1 
else F := F(n - 1) + F(n - 2); 
end;', 30, 34, N'T02', N'3.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00032', N'Đoạn chương trình cài đặt stack bằng mảng. program StackByArray; 
const
max = 10000; 
var
Stack: array[1..max] of Integer;
Last: Integer;

procedure StackInit; 
begin
Last := 0; 
end;

procedure Push(V: Integer); 
begin
if Last = max then WriteLn(''Stack is full'') 
else
begin
Inc(Last); Stack[Last] := V; 
end;
end;

function Pop: Integer; 
begin
if Last = 0 then WriteLn(''Stack is empty'') 
else
begin
Pop := Stack[Last]; Dec(Last); 
end;
end;

begin
StackInit;
<Test>;
end;', 7, 40, N'T04', N'5.1')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00033', N'Đoạn chương trình cài đặt stack bằng danh sách liên kết đơn. program StackByLinkedList; 
type
PNode = ^TNode; 
TNode = record;
Value: Integer;
Link: PNode;
end; 
var
Last: Pnode;

procedure StackInit; {Khởi tạo Stack rỗng}
begin
Last := nil; 
end;

procedure Push(V: Integer);
var
P: PNode; 
begin
New(P); P^.Value := V; 
P^.Link := Last; Last := P; 
end;

function Pop: Integer; 
var
P: PNode; 
begin
if Last = nil then WriteLn(''Stack is empty'') 
else
begin
Pop := Last^.Value; 
P := Last^.Link; 
Dispose(Last); Last := P;
end;
end;

begin
StackInit;
<Test>; 
end.', 44, 83, N'T04', N'5.1')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00034', N'Đoan chương trình cài đặt queue bằng mảng. program QueueByArray; 
const
max = 10000; 
var
Queue: array[1..max] of Integer;
First, Last: Integer;

procedure QueueInit; {Khởi tạo một hàng đợi rỗng}
begin
First := 1; Last := 0; 
end;

procedure Push(V: Integer); {Đẩy V vào hàng đợi}
begin
if Last = max then WriteLn(''Overflow'') 
else
begin
Inc(Last);
Queue[Last] := V;
end;
end;

function Pop: Integer; 
begin
if First > Last then WriteLn(''Queue is Empty'') 
else
begin
Pop := Queue[First];
Inc(First);
end;
end; 
begin
QueueInit;
<Test>;
end;', 10, 44, N'T04', N'5.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00035', N'Đoạn chương trình cài đặt queue bằng danh sách vòng. program QueueByCList; 
const
max = 10000; 
var
Queue: array[0..max - 1] of Integer; 
i, n, First, Last: Integer;

procedure QueueInit; {Khởi tạo Queue rỗng}
begin
First := 0; 
Last := max - 1; 
n := 0; 
end;

procedure Push(V: Integer); {Đẩy giá trị V vào Queue}
begin
if n = max then WriteLn(''Queue is Full'') 
else
begin
Last := (Last + 1) mod max; 
Queue[Last] := V;
Inc(n);
end;

function Pop: Integer; 
begin
if n = 0 then WriteLn(''Queue is Empty'') 
else
begin
Pop := Queue[First];
First := (First + 1) mod max; 
Dec(n); 
end;
end;

begin
QueueInit;
<Test>; 
end.', 50, 88, N'T04', N'5.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00036', N'Đoạn chương trình cài đặt queue bằng danh sách liên kết đơn. program QueueByLinkedList;
type
PNode = ^TNode; 
TNode = record 
Value: Integer;
Link: PNode;
end; 
var
First, Last: PNode; 

procedure QueueInit; 
begin
First := nil; 
end;

procedure Push(V: Integer); {Đẩy giá trị V vào Queue}
var
P: PNode; 
begin
New(P); 
P^.Value := V; 
P^.Link := nil;
if First = nil then First := P 
else 
Last^.Link := P;
Last := P; 
end;

function Pop: Integer; 
var
P: PNode; 
begin
if First = nil then WriteLn(''Queue is empty'') 
else
begin
Pop := First^.Value; 
P := First^.Link; 
Dispose(First); 
First := P; 
end;
end;

begin
QueueInit;
<Test>; 
end.
', 91, 144, N'T04', N'5.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00037', N'Thủ tục duyệt cây nhị phân theo thứ tự trước. procedure Visit(N); 
begin
if N ¹  nil then begin
<Output trường Info của nút N> 
Visit(Nút con trái của N); 
Visit(Nút con phải của N);
end;
end;', 5, 12, N'T03', N'6.4')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00038', N'Thủ tục duyệt cây nhị phân theo thứ tự giữa. procedure Visit(N); 
begin
if N ¹  nil then 
begin
Visit(Nút con trái của N);
<Output trường Info của nút N> 
Visit(Nút con phải của N);
end;
end;', 18, 26, N'T03', N'6.4')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00039', N'Thủ tục duyệt cây nhị phận theo tứ tự sau. procedure Visit(N);
begin
if N ¹  nil then 
begin
Visit(Nút con trái của N);
Visit(Nút con phải của N);
<Output trường Info của nút N> 
end;
end;', 33, 41, N'T03', N'6.4')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00040', N'Hàm tính giá trị biểu thức. function Calculate(n): Value; 
begin
if <Nút n chứa không phải là một toán tử> then 
Calculate := <Giá trị chứa trong nút n>
else 
begin
x := Calculate(nút con trái của n); 
y := Calculate(nút con phải của n); 
Calculate := x R y;
end; 
end;', 4, 14, N'T02', N'7.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00041', N'Đoạn chương trình tính giá trị biểu thức RPN. program CalculateRPNExpression; 
const
Opt = [''+'', ''-'', ''*'', ''/''];
var
T, RPN: String;
Stack: array[1..255] of Extended; 
p, Last: Integer;

procedure StackInit; 
begin
Last := 0; 
end;

procedure Push(V: Extended); 
begin
Inc(Last); 
Stack[Last] := V; 
end;

function Pop: Extended; 
begin
Pop := Stack[Last]; 
Dec(Last); 
end;

procedure Refine(var S: String); 
var
i: Integer; 
begin
S := S + '' '';
for i := Length(S) - 1 downto 1 do
if (S[i] in Opt) or (S[i + 1] in Opt) then 
Insert('' '', S, i + 1);
for i := Length(S) - 1 downto 1 do
if (S[i] = '' '') and (S[i + 1] = '' '') then 
Delete(S, i + 1, 1);
end;

procedure Process(T: String); 
var
x, y: Extended; e: Integer;
begin
if not (T[1] in Opt) then 
begin
Val(T, x, e); Push(x); 
end
else 
begin
y := Pop; 
x := Pop;
case T[1] of
''+'': x := x + y;
''-'': x := x - y;
''*'': x := x * y;
''/'': x := x / y; 
end;
Push(x); {Vào một}
end;
end;

begin
Write(''Enter RPN Expression: ''); 
ReadLn(RPN); 
Refine(RPN);
StackInit;
T := '''';
for p := 1 to Length(RPN) do 
if RPN[p] <> '' '' then T := T + RPN[p]
else
begin
Process(T);
T := ''''; {Đặt lại T để chuẩn bị đọc phần tử mới}
end;
WriteLn(RPN, '' = '', Pop:0:4); {In giá trị biểu thức RPN được lưu trong Stack}
end.', 80, -1, N'T04', N'7.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00042', N'Đoạn chương trình chuyển biểu thức viết ở dạng trung tố sang dạng RPN', 113, -1, N'T04', N'7.4')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00043', N'Thủ tục sắp xếp kiểu chọn. procedure SelectionSort; 
var
i, j, jmin: Integer; 
begin
for i := 1 to n - 1 do {Làm n - 1 lượt}
begin
{Chọn trong số các khoá từ ki tới kn ra khoá kjmin nhỏ nhất}
jmin := i;
for j := i + 1 to n do
if kj < kjmin then jmin := j; 
if jmin ¹ i then
<Đảo giá trị của kjmin cho ki>
end; 
end;', 8, 21, N'T03', N'8.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00044', N'Thủ tục sắp xếp nổi bọt. procedure BubbleSort; 
var
i, j: Integer; 
begin
for i := 2 to n do
for j := n downto i do {Duyệt từ cuối dãy lên, làm nổi khoá nhỏ nhất trong số ki-1, …,kn về vị trí i-1}
if kj < kj-1 then
<Đảo giá trị kj và kj-1>
end;', 2, 10, N'T03', N'8.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00045', N'Thủ tục sắp xếp chèn. procedure InsertionSort; 
var
i, j: Integer;
tmp: TKey; {Biến giữ lại giá trị khoá chèn}
begin
for i := 2 to n do {Chèn giá trị ki vào dãy k1,…, ki-1 để toàn đoạn k1, k2,…, ki trở thành đã sắp xếp}
begin
tmp := ki; {Giữ lại giá trị ki}
j := i - 1;
while (j > 0) and (tmp < kj) do {So sánh giá trị cần chèn với lần lượt các khoá kj (i-1j0)}
begin
kj+1 := kj; {Đẩy lùi giá trị kj về phía sau một vị trí, tạo ra "khoảng trống" tại vị trí j}
j := j - 1;
end;
kj+1 := tmp; {Đưa giá trị chèn vào "khoảng trống" mới tạo ra}
end; 
end;', 2, 18, N'T03', N'8.4')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00046', N'Thủ tục sắp xếp chèn với tìm kiếm nhị phân. procedure InsertionSortwithBinarySearching; 
var
i, inf, sup, median: Integer; 
tmp: TKey;
begin
for i := 2 to n do 
begin
tmp := ki; {Giữ lại giá trị ki}
inf := 1; sup := i - 1; {Tìm chỗ chèn giá trị tmp vào đoạn từ kinf tới ksup+1}
repeat {Sau mỗi vòng lặp này thì đoạn tìm bị co lại một nửa}
median := (inf + sup) div 2; {Xét chỉ số nằm giữa chỉ số inf và chỉ số sup}
if tmp < k[median] then sup := median - 1 
else inf := median + 1;
until inf > sup; {Kết thúc vòng lặp thì inf = sup + 1 chính là vị trí chèn}
<Dịch các phần tử từ kinf tới ki-1 lùi sau một vị trí>
kinf := tmp; {Đưa giá trị tmp vào "khoảng trống" mới tạo ra}
end; 
end;', 26, -1, N'T03', N'8.4')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00047', N'Thủ tục shellsort. procedure ShellSort; 
var
i, j, h: Integer; 
tmp: TKey;
begin
h := n div 2;
while h <> 0 do {Làm mịn dãy với độ dài bước h}
begin
for i := h + 1 to n do
begin {Sắp xếp chèn trên dãy con ai-h, ai, ai+h, ai+2h, …}
tmp := ki; 
j := i - h;
while (j > 0) and (kj > tmp) do 
begin
kj+h := kj; 
j := j - h;
end;
kj+h := tmp; 
end;
h := h div 2; 
end;
end;
', 15, -1, N'T03', N'8.5')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00048', N'Thủ tục sắp xếp nhanh. procedure QuickSort;

procedure Partition(L, H: Integer); {Sắp xếp đoạn từ kL, kL+1, …, kH}
var
i, j: Integer;
Pivot: TKey; {Biến lưu giá trị khoá chốt}
begin
if L ³ H then Exit; {Nếu đoạn chỉ có £ 1 phần tử thì không phải làm gì cả} 
Pivot := kRandom(H-L+1)+L; {Chọn một khoá ngẫu nhiên trong đoạn làm khoá chốt} i := L; 
j := H; {i := vị trí đầu đoạn; j := vị trí cuối đoạn}
repeat
while ki < Pivot do i := i + 1; {Tìm từ đầu đoạn khoá ³ khoá chốt}
while kj > Pivot do j := j - 1; {Tìm từ cuối đoạn khoá £ khoá chốt}
{Đến đây ta tìm được hai khoá ki và kj mà ki ³ key ³ kj}
if i £ j then 
begin
if i < j then {Nếu chỉ số i đứng trước chỉ số j thì đảo giá trị hai khoá ki và kj}
<Đảo giá trị ki và kj> {Sau phép đảo này ta có: ki £ key £ kj }
i := i + 1; 
j := j - 1;
end; 
until i > j;
Partition(L, j); 
Partition(i, H); {Sắp xếp hai đoạn con mới tạo ra}
end;

begin
Partition(1, n); 
end;', 4, 32, N'T03', N'8.6')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00049', N'Thủ tục sắp xếp nhanh được cải tiến. procedure QuickSort;

procedure Partition(L, H: Integer); {Sắp xếp đoạn từ kL, kL+1, …, kH}
var
i, j: Integer; 
begin
repeat
if L ³ H then Exit;
<Phân đoạn [L, H] được hai đoạn con [L, j] và [i, H]> 
if <đoạn [L, j] ngắn hơn đoạn [i, H]> then
begin
Partition(L, j); 
L := i; 
end
else
begin
Partition(i, H); 
H := j; 
end;
until False; 
end;

begin
Partition(1, n); 
end;', 49, 73, N'T03', N'8.6')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00050', N'Thủ tục heapsort. procedure HeapSort; 
var
r, i: Integer;

procedure Adjust(root, endnode: Integer); {Vun cây gốc Root thành đống}
var
c: Integer;
Key: TKey; {Biến lưu giá trị khoá ở nút Root}
begin
Key := kroot;
while root * 2 £ endnode do {Chừng nào root chưa phải là lá}
begin
c := Root * 2; {Xét nút con trái của Root, so sánh với giá trị nút con phải, chọn ra nút mang giá trị lớn nhất}
if (c < endnode) and (kc < kc+1) then c := c + 1;
if kc £ Key then Break; {Cả hai nút con của Root đều mang giá trị £ Key thì dừng ngay}
kroot := kc; root := c; {Chuyển giá trị từ nút con c lên nút cha root và đi xuống xét nút con c}
end;
kroot := Key; {Đặt giá trị Key vào nút root}
end;

begin {Bắt đầu thuật toán HeapSort}
for r := n div 2 downto 1 do Adjust(r, n); {Vun cây từ dưới lên tạo thành đống}
for i := n downto 2 do 
begin
<Đảo giá trị k1 và ki> {Khoá lớn nhất được chuyển ra cuối dãy}
Adjust(1, i - 1); {Vun phần còn lại thành đống}
end; 
end;', 23, 50, N'T03', N'8.7')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00051', N'Thủ tục sắp xếp bằng cách đếm phân phối. procedure DistributionCounting; {TKey = 0..M}
var
c: array[0..M] of Integer; {Dãy biến đếm số lần xuất hiện mỗi giá trị}
x: TArray; {Dãy khoá phụ}
i: Integer;
V: TKey;
begin
for V := 0 to M do cV := 0; {Khởi tạo dãy biến đếm}
for i := 1 to n do cki := cki + 1; {Đếm số lần xuất hiện các giá trị}
for V := 1 to M do cV := cV-1 + cV; {Tính vị trí cuối mỗi đoạn}
for i := n downto 1 do 
begin
V := ki;
xcV := ki; cV := cV - 1; 
end;
k := x; {Sao chép giá trị từ dãy khoá x sang dãy khoá k}
end;', 27, 43, N'T03', N'8.8')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00052', N'Thủ tục sắp xếp cơ số theo kiểu hoán vị các khoá. procedure ExchangeRadixSort; 
var
z: Integer; {Độ dài dãy bit biểu diễn mỗi khoá}

procedure Partition(L, H, b: Integer); {Phân đoạn [L, H] dựa vào bit b}
var
i, j: Integer; 
begin
if L ³ H then Exit; 
i := L; 
j := H;
repeat
{Hai vòng lặp trong dưới đây luôn cầm canh i < j}
while (i < j) and (Bit b của ki = 0) do i := i + 1; {Tìm khoá có bit b = 1 từ đầu đoạn}
while (i < j) and (Bit b của kj = 1) do j := j - 1; {Tìm khoá có bit b = 0 từ cuối đoạn}
<Đảo giá trị ki cho kj>; until i = j;
if <Bit b của kj = 0> then j := j + 1; {j là điểm bắt đầu của đoạn có bit b là 1}
if b > 0 then {Chưa xét tới bit đơn vị}
begin
Partition(L, j - 1, b - 1); 
Partition(j, R, b - 1); end;
end;

begin
<Dựa vào giá trị lớn nhất của dãy khoá, xác định z là độ dài dãy bit biểu diễn mỗi khoá> 
Partition(1, n, z - 1);
end;', 20, 46, N'T03', N'8.10')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00053', N'Thủ tục sắp xếp cơ số trực tiếp. procedure StraightRadixSort; 
const
radix = …; {Tuỳ chọn hệ cơ số radix cho hợp lý}
var
t: TArray; {Dãy khoá phụ}
p: Integer;
nDigit: Integer; {Số chữ số cho một khoá, đánh số từ chữ số thứ 0 là hàng đơn vị đến chữ số thứ nDigit - 1}
Flag: Boolean; {Flag = True thì sắp dãy k, ghi kết quả vào dãy t; Flag = False thì sắp dãy t, ghi kq vào k}

function GetDigit(Num: TKey; p: Integer): Integer; {Lấy chữ số thứ p của số Num (0p<nDigit)}
begin
GetDigit := Num div radixp mod radix; {Trường hợp cụ thể có thể có cách viết tốt hơn}
end;

{Sắp xếp ổn định dãy số x theo thứ tự tăng dần của chữ số thứ p, kết quả sắp xếp được chứa vào dãy số y}
procedure DCount(var x, y: TArray; p: Integer); {Thuật toán đếm phân phối, sắp từ x sang y}
var
c: array[0..radix - 1] of Integer; {cd là số lần xuất hiện chữ số d tại vị trí p}
i, d: Integer; 
begin
for d := 0 to radix - 1 do cd := 0; 
for i := 1 to n do
begin
d := GetDigit(xi, p); 
cd := cd + 1; 
end;
for d := 1 to radix - 1 do cd := cd-1 + cd; {các cd trở thành các mốc cuối đoạn}
for i := n downto 1 do {Điền giá trị vào dãy y}
begin
d := GetDigit(xi, p); 
ycd := xi; 
cd := cd - 1;
end;
end;

begin {Thuật toán sắp xếp cơ số trực tiếp}
<Dựa vào giá trị lớn nhất trong dãy khoá, xác định nDigit là số chữ số phải dùng cho mỗi khoá trong hệ radix>; 
Flag := True;
for p := 0 to nDigit - 1 do {Xét từ chữ số hàng đơn vị lên, sắp xếp ổn định theo chữ số thứ p}
begin
if Flag then DCount(k, t, p) 
else DCount(t, k, p);
Flag := not Flag; {Đảo cờ, dùng k tính t rồi lại dùng t tính k …}
end;
if not Flag then k := t; {Nếu kết quả cuối cùng đang ở trong t thì sao chép giá trị từ t sang k}
end;', 71, 116, N'T03', N'8.10')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00054', N'Thủ tục sắp xếp bằng trộn 2 đường trực tiếp. procedure MergeSort; 
var
t: TArray; {Dãy khoá phụ}
len: Integer;
Flag: Boolean; {Flag = True: trộn các mạch trong k vào t; Flag = False: trộn các mạch trong t vào k}

procedure Merge(var X, Y: TArray; a, b, c: Integer);{Trộn Xa…Xb và Xb+1…Xc}
var
i, j, p: Integer; 
begin
{Chỉ số p chạy trong miền sắp xếp, i chạy theo mạch thứ nhất, j chạy theo mạch thứ hai}
p := a; 
i := a; 
j := b + 1;
while (i £ b) and (j £ c) then {Chừng nào cả hai mạch đều chưa xét hết}
begin
if Xi £ Xj then {So sánh hai phần tử nhỏ nhất trong hai mạch mà chưa bị đưa vào miền sắp xếp}
begin
Yp := Xi; 
i := i + 1; {Đưa xi vào miền sắp xếp và cho i chạy}
end 
else
begin
Yp := Xj; 
j := j + 1; {Đưa xj vào miền sắp xếp và cho j chạy}
end;
p := p + 1;
end;
if i £ b then (Yp, Yp+1, …, Yc) := (Xi, Xi+1, …, Xb) {Mạch 2 hết trước, Đưa phần cuối của mạch 1 vào miến sắp xếp}
else (Yp, Yp+1, …, Yc) := (Xj, Xj+1, …, Xc); {Mạch 1 hết trước, Đưa phần cuối của mạch 2 vào miến sắp xếp}
end;

procedure MergeByLength(var X, Y: TArray; len: Integer); 
begin
a := 1; 
b := len; 
c := 2 * len;
while c £ n do {Trộn hai mạch xa…xb và xb+1…xc đều có độ dài len}
begin
Merge(X, Y, a, b, c);
a := a + 2 * len; 
b := b + 2 * len; 
c := c + 2 * len; {Dịch các chỉ số a, b, c về sau 2.len vị trí}
end;
if b < n then Merge(X, Y, a, b, n) {Còn lại hai mạch mà mạch thứ hai có độ dài ngắn hơn len}
else
if a £ n then (Ya, Ya+1, …, Yn) := (Xa, Xa+1, …, Xn); {Còn lại một mạch thì đưa thẳng mạch đó sang miền y}
end;

begin {Thuật toán sắp xếp trộn}
Flag := True; 
len := 1;
while len < n do 
begin
if Flag then MergeByLength(k, t, len) else MergeByLength(t, k, len); len := len * 2;
Flag := not Flag; {Đảo cờ để luân phiên vai trò của k và t}
end;
if not Flag then k := t; {Nếu kết quả cuối cùng đang nằm trong t thì sao chép kết quả vào k}
end;', 53, 111, N'T03', N'8.11')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00055', N'Đoạn chương trình minh hoạ các thuật toán sắp xếp. program SortingAlgorithmsDemo; 
uses crt;
const
InputFile = ''SORT.INP''; 
OutputFile = ''SORT.OUT'';
 	max = 15000;
maxV = 15000;
Interval = 1193180 / 65536; {Tần số đồng hồ » 18.2 lần / giây}
nMenu = 12;
SMenu: array[0..nMenu] of String = (
''	0. Display Input'', 
''	1. SelectionSort'',
''	2. BubbleSort'',
''	3. InsertionSort'',
''	4. InsertionSort with binary searching'', 
'' 	5. ShellSort'',
''	6. QuickSort'',
''	7. HeapSort'',
''	8. Distribution Counting'', 
''	9. Exchange RadixSort'',
''	10. Straight RadixSort'', 
'' 	11. MergeSort'',
''	12. Exit''
);
type
TArr = array[1..max] of Integer; 
TCount = array[0..maxV] of Integer;
var
k: TArr;
n: Integer; 
selected: Integer; 
StTime: LongInt;
Time: LongInt absolute 0:$46C; {Biến đếm nhịp đồng hồ}

procedure Enter; {Trước mỗi thuật toán sắp xếp, gọi thủ tục này để nhập liệu}
var
f: Text; 
begin
Assign(f, InputFile); 
Reset(f); 
n := 0;
while not SeekEof(f) do 
begin
Inc(n); 
Read(f, k[n]); 
end;
Close(f);
StTime := Time; {Nhập xong bắt đầu tính thời gian ngay}
end;

procedure PrintInput; {In dữ liệu}
var
i: Integer; 
begin
Enter;
for i := 1 to n do Write(k[i]:8); 
Write(''Press any key to return to menu…'');
ReadKey; 
end;

procedure PrintResult; {In kết quả của mỗi thuật toán sắp xếp}
var
f: Text;
i: Integer; 
ch: Char;
begin
{Trước hết in ra thời gian thực thi}
WriteLn(''Running Time = '', (Time - StTime) / Interval:1:10, '' (s)''); 
Assign(f, OutputFile); 
Rewrite(f);
for i := 1 to n do WriteLn(f, k[i]);
Close(f);
Write(''Press <P> to print Output, another key to return to menu…''); 
ch := ReadKey; 
WriteLn(ch);
if Upcase(ch) = ''P'' then 
begin
for i := 1 to n do Write(k[i]:8); 
WriteLn;
Write(''Press any key to return to menu…''); 
ReadKey;
end;
end;

procedure Swap(var x, y: Integer); {Thủ tục đảo giá trị hai tham biến x, y}
var
t: Integer; 
begin
t := x; 
x := y; 
y := t; 
end;

(** SELECTIONSORT *************************************************) procedure SelectionSort;
var
i, j, jmin: Integer; 
begin
Enter;
for i := 1 to n - 1 do 
begin
jmin := i;
for j := i + 1 to n do
if k[j] < k[jmin] then jmin := j; if jmin <> i then Swap(k[i], k[jmin]);
end;
PrintResult;
end;

(** BUBBLESORT ****************************************************) procedure BubbleSort;
var
i, j: Integer; 
begin
Enter;
for i := 2 to n do
for j := n downto i do
if k[j - 1] > k[j] then Swap(k[j - 1], k[j]); 
PrintResult;
end;

(** INSERTIONSORT *************************************************) procedure InsertionSort;
var
i, j, tmp: Integer; 
begin
Enter;
for i := 2 to n do 
begin
tmp := k[i]; 
j := i - 1;
while (j > 0) and (tmp < k[j]) do 
begin
k[j + 1] := k[j];
Dec(j);
end;
k[j + 1] := tmp; 
end;
PrintResult;
end;

(** INSERTIONSORT WITH BINARY SEARCHING ***************************) 
procedure AdvancedInsertionSort;
var
i, inf, sup, median, tmp: Integer; 
begin
Enter;
for i := 2 to n do 
begin
tmp := k[i];
inf := 1; 
sup := i - 1; 
repeat
median := (inf + sup) shr 1;
if tmp < k[median] then sup := median - 1 
else inf := median + 1;
until inf > sup;
Move(k[inf], k[inf + 1], (i - inf) * SizeOf(k[1])); 
k[inf] := tmp;
end;
PrintResult;
end;

(** SHELLSORT *****************************************************) procedure ShellSort;
var
tmp: Integer;
i, j, h: Integer; 
begin
Enter;
h := n shr 1; 
while h <> 0 do
begin
for i := h + 1 to n do 
begin
tmp := k[i]; 
j := i - h;
while (j > 0) and (k[j] > tmp) do 
begin
k[j + h] := k[j]; 
j := j - h;
end;
k[j + h] := tmp; 
end;
h := h shr 1; 
end;
PrintResult; 
end;

(** QUICKSORT *****************************************************) procedure QuickSort;

procedure Partition(L, H: Integer); 
var
i, j: Integer;
Pivot: Integer;
begin
if L >= H then Exit;
Pivot := k[L + Random(H - L + 1)]; 
i := L; 
j := H;
repeat
while k[i] < Pivot do Inc(i); 
while k[j] > Pivot do Dec(j); 
if i <= j then
begin
if i < j then Swap(k[i], k[j]);
Inc(i); 
Dec(j); 
end;
until i > j;
Partition(L, j); 
Partition(i, H); 
end;

begin
Enter;
Partition(1, n);
PrintResult;
end;

(** HEAPSORT ******************************************************) procedure HeapSort;
var
r, i: Integer;

procedure Adjust(root, endnode: Integer); 
var
key, c: Integer; 
begin
key := k[root];
while root shl 1 <= endnode do 
begin
c := root shl 1;
if (c < endnode) and (k[c] < k[c + 1]) then Inc(c); 
if k[c] <= key then Break;
k[root] := k[c]; 
root := c; 
end;
k[root] := key; 
end;

begin
Enter;
for r := n shr 1 downto 1 do Adjust(r, n); 
for i := n downto 2 do
begin
Swap(k[1], k[i]);
Adjust(1, i - 1);
end;
PrintResult;
end;

(** DISTRIBUTION COUNTING ******************************************) 
procedure DistributionCounting;
var
x: TArr; c: TCount;
i, V: Integer; 
begin
Enter;
FillChar(c, SizeOf(c), 0);
for i := 1 to n do Inc(c[k[i]]);
for V := 1 to MaxV do c[V] := c[V - 1] + c[V]; 
for i := n downto 1 do
begin
V := k[i]; 
x[c[V]] := k[i]; 
Dec(c[V]);
end; 
k := x;
PrintResult; 
end;
 

(** EXCHANGE RADIXSORT ********************************************) 
procedure RadixSort;
const
MaxBit = 13; 
var
MaskBit: array[0..MaxBit] of Integer; 
MaxValue, i: Integer;

procedure Partition(L, H, BIndex: Integer); 
var
i, j, Mask: Integer; 
begin
if L >= H then Exit;
i := L; j := H; Mask := MaskBit[BIndex]; 
repeat
while (i < j) and (k[i] and Mask = 0) do Inc(i); 
while (i < j) and (k[j] and Mask <> 0) do Dec(j); 
Swap(k[i], k[j]);
until i = j;
if k[j] and Mask = 0 then Inc(j); 
if BIndex > 0 then
begin
Partition(L, j - 1, BIndex - 1); 
Partition(j, H, BIndex - 1); 
end;
end;

begin
Enter;
for i := 0 to MaxBit do MaskBit[i] := 1 shl i; 
maxValue := k[1];
for i := 2 to n do
if k[i] > MaxValue then maxValue := k[i]; 
i := 0;
while (i < MaxBit) and (MaskBit[i + 1] <= MaxValue) do Inc(i); 
Partition(1, n, i);
PrintResult; 
end;

(** STRAIGHT RADIXSORT ********************************************) 
procedure StraightRadixSort;
const
Radix = 256;
nDigit = 2; 
var
t: TArr;
p: Integer;
Flag: Boolean;

function GetDigit(key, p: Integer): Integer; 
begin
if p = 0 then GetDigit := key and $FF else GetDigit := key shr 8;
end;

procedure DCount(var x, y: TArr; p: Integer); 
var
c: array[0..Radix - 1] of Integer; i, d: Integer;
begin
FillChar(c, SizeOf(c), 0); 
for i := 1 to n do
begin
d := GetDigit(x[i], p); Inc(c[d]);
end;
for d := 1 to Radix - 1 do c[d] := c[d - 1] + c[d]; 
for i := n downto 1 do
begin
d := GetDigit(x[i], p);
y[c[d]] := x[i];
Dec(c[d]);
end;
end;

begin
Enter;
Flag := True;
for p := 0 to nDigit - 1 do 
begin
if Flag then DCount(k, t, p) 
else DCount(t, k, p);
Flag := not Flag; 
end;
if not Flag then k := t;
PrintResult;
end;

(** MERGESORT *****************************************************) procedure MergeSort;
var
t: TArr;
Flag: Boolean; 
len: Integer;

procedure Merge(var Source, Dest: TArr; a, b, c: Integer); 
var
i, j, p: Integer; 
begin
p := a; i := a; j := b + 1; 
while (i <= b) and (j <= c) do
begin
if Source[i] <= Source[j] then 
begin
Dest[p] := Source[i]; 
Inc(i); 
end;
else
begin
Dest[p] := Source[j]; 
Inc(j); 
end;
Inc(p); 
end;
if i <= b then
Move(Source[i], Dest[p], (b - i + 1) * SizeOf(Source[1])) 
else
Move(Source[j], Dest[p], (c - j + 1) * SizeOf(Source[1]));
end;

procedure MergeByLength(var Source, Dest: TArr; len: Integer); 
var
a, b, c: Integer; 
begin
a := 1; 
b := len; 
c := len shl 1; 
while c <= n do
begin
Merge(Source, Dest, a, b, c);
a := a + len shl 1; 
b := b + len shl 1; 
c := c + len shl 1; 
end;
if b < n then Merge(Source, Dest, a, b, n)
else
Move(Source[a], Dest[a], (n - a + 1) * SizeOf(Source[1]));
end;

begin
Enter;
len := 1; 
Flag := True; 
FillChar(t, SizeOf(t), 0); 
while len < n do
begin
if Flag then MergeByLength(k, t, len) 
else MergeByLength(t, k, len);
len := len shl 1; Flag := not Flag;
end;
if not Flag then k := t;
PrintResult;
end; (*******************************************************************)

function MenuSelect: Integer; 
var
ch: Integer; 
begin
Clrscr;
WriteLn(''Sorting Algorithms Demos; Input: SORT.INP; Output: SORT.OUT''); for ch := 0 to nMenu do WriteLn(SMenu[ch]);
Write(''Enter your choice: ''); ReadLn(ch); MenuSelect := ch;
end;

begin
repeat
selected := MenuSelect; 
WriteLn(SMenu[selected]); 
case selected of
0: PrintInput;
1: SelectionSort;
2: BubbleSort;
3: InsertionSort;
4: AdvancedInsertionSort;
5: ShellSort;
6: QuickSort;
7: HeapSort;
8: DistributionCounting;
9: RadixSort;
10: StraightRadixSort;
11: MergeSort;
12: Halt; 
end;
until False; 
end.', 41, -1, N'T04', N'8.12')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00056', N'Hàm tìm kiếm tuần tự. {Tìm kiếm tuần tự trên dãy khoá k1, k2, …, kn; hàm này thử tìm xem trong dãy có khoá nào = X không, nếu thấy nó trả về chỉ số của khoá ấy, nếu không thấy nó trả về 0. Có sử dụng một khoá phụ kn+1 được gán giá trị = X}
function SequentialSearch(X: TKey): Integer; 
var
i: Integer; 
begin
i := 1;
while (i <= n) and (ki ¹ X) do i := i + 1; 
if i = n + 1 then SequentialSearch := 0; 
else SequentialSearch := i;
end;', 2, 11, N'T02', N'9.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00057', N'Hàm tìm kiếm nhị phân. function BinarySearch(X: TKey): Integer; 
var
inf, sup, median: Integer; 
begin
inf := 1; 
sup := n; 
while inf £ sup do
begin
median := (inf + sup) div 2; 
if kmedian = X then
begin
BinarySearch := median;
Exit;
end;
if kmedian < X then inf := median + 1 
else sup := median - 1;
end;
BinarySearch := 0;
end;', 8, 26, N'T02', N'9.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00058', N'Thủ tục cây nhị phân tìm kiếm. {Thủ tục chèn khoá X vào BST}
procedure BSTInsert(X); 
var
p, q: PNode; 
begin
q := nil; 
p := Root; {Bắt đầu với p = nút gốc; q là con trỏ chạy đuổi theo sau}
while p ¹ nil do 
begin
q := p;
if X = p^.Info then Break;
else {X ¹ p^.Info thì cho p chạy sang nút con, q^ luôn giữ vai trò là cha của p^}
if X < p^.Info then p := p^.Left 
else p := p^.Right;
end;
if p = nil then {Khoá X chưa có trong BST}
begin
New(p); {Tạo nút mới}
p^.Info := X; {Đưa giá trị X vào nút mới tạo ra}
p^.Left := nil; 
p^.Right := nil; {Nút mới khi chèn vào BST sẽ trở thành nút lá} 
if Root = nil then Root := NewNode {BST đang rỗng, đặt Root là nút mới tạo} 
else {Móc NewNode^ vào nút cha q^}
if X < q^.Info then q^.Left := NewNode 
else q^.Right := NewNode;
end; 
end;', 32, 58, N'T03', N'9.4')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00059', N'Thủ tục xoá khoá X khỏi cây nhị phân tìm kiếm. procedure BSTDelete(X: TKey); 
var
p, q, Node, Child: PNode; 
begin
p := Root; 
q := nil; {Về sau, khi p trỏ sang nút khác, ta luôn giữ cho q^ luôn là cha của p^}
while p ¹ nil do {Tìm xem trong cây có khoá X không?}
begin
if p^.Info = X then Break; {Tìm thấy}
q := p;
if X < p^.Info then p := p^.Left 
else p := p^.Right;
end;
if p = nil then Exit; {X không tồn tại trong BST nên không xoá được}
if (p^.Left  nil) and (p^.Right  nil) then {p^ có cả con trái và con phải}
begin
Node := p; {Giữ lại nút chứa khoá X}
q := p; 
p := p^.Left; {Chuyển sang nhánh con trái để tìm nút cực phải}
while p^.Right ¹ nil do 
begin
q := p; 
p := p^.Right; 
end;
Node^.Info := p^.Info; {Chuyển giá trị từ nút cực phải trong nhánh con trái lên Node^}
end;', 75, 100, N'T03', N'9.4')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00060', N'Hàm tìm kiếm khoá X trên cây tìm kiếm số học. {Hàm tìm kiếm trên cây tìm kiếm số học, nó trả về nút chứa khoá tìm kiếm X nếu tìm thấy, trả về nil nếu không tìm thấy. z là độ dài dãy bit biểu diễn một khoá}
function DSTSearch(X: TKey): PNode; 
var
b: Integer; 
p: PNode;
begin
b := z; p := Root; {Bắt đầu với nút gốc}
while (p ¹ nil) and (p^.Info ¹ X) do {Chưa gặp phải một trong 2 tình huống trên}
begin
b := b - 1; {Xét bit b của X}
if <Bit b của X là 0> then p := p^.Left {Gặp 0 rẽ trái}
else p := p^.Right; {Gặp 1 rẽ phải}
end;
DSTSearch := p;
end;', 22, 36, N'T02', N'9.7')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00061', N'Thủ tục chèn khoá X vào cây tìm kiếm số học. {Thủ tục chèn khoá X vào cây tìm kiếm số học}
procedure DSTInsert(X: TKey); 
var
b: Integer; 
p, q: PNode;
begin
b := z;
p := Root;
while (p ¹ nil) and (p^.Info ¹ X) do 
begin
b := b - 1; {Xét bit b của X}
q := p; {Khi p chạy xuống nút con thì q^ luôn giữ vai trò là nút cha của p^}
if <Bit b của X là 0> then p := p^.Left {Gặp 0 rẽ trái}
else p := p^.Right; {Gặp 1 rẽ phải}
end;
if p = nil then	{Giá trị X chưa có trong cây}
begin
New(p); {Tạo ra một nút mới p^}
p^.Info := X; {Nút mới tạo ra sẽ chứa khoá X}
p^.Left := nil; 
p^.Right := nil; {Nút mới đó sẽ trở thành một lá của cây}
if Root = nil then Root := p {Cây đang là rỗng thì nút mới thêm trở thành gốc}
else {Không thì móc p^ vào mối nối vừa rẽ sang từ q^}
if <Bit b của X là 0> then q^.Left := p 
else q^.Right := p;
end; 
end;', 38, 64, N'T03', N'9.7')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00062', N'Thủ tục xoá khoá X khỏi cây tìm kiếm số học. {Thủ tục xoá khoá X khỏi cây tìm kiếm số học}
procedure DSTDelete(X: TKey); 
var
b: Integer;
p, q, Node: PNode; 
begin
{Trước hết, tìm kiếm giá trị X xem nó nằm ở nút nào}
b := z;
p := Root;
while (p ¹ nil) and (p^.Info ¹ X) do 
begin
b := b - 1;
q := p; {Mỗi lần p chuyển sang nút con, ta luôn đảm bảo cho q^ là nút cha của p^}
if <Bit b của X là 0> then p := p^.Left 
else p := p^.Right;
end;
if p = nil then Exit; {X không tồn tại trong cây thì không xoá được}
Node := p; {Giữ lại nút chứa khoá cần xoá}
while (p^.Left ¹ nil) or (p^.Right ¹ nil) do {chừng nào p^ chưa phải là lá}
begin
q := p; {q chạy đuổi theo p, còn p chuyển xuống một trong 2 nhánh con}
if p^.Left ¹ nil then p := p^.Left 
else p := p^.Right;
end;
Node^.Info := p^.Info; {Chuyển giá trị từ nút lá p^ sang nút Node^}
if Root = p then Root := nil {Cây chỉ gồm một nút gốc và bây giờ xoá cả gốc}
else {Cắt mối nối từ q^ tới p^}
if q^.Left = p then q^.Left := nil 
else q^.Right := nil;
Dispose(p); 
end;', 66, 96, N'T03', N'9.7')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00063', N'Hàm tìm kiếm khoá X trên cây tìm kiếm cơ số. function RSTSearch(X: TKey): PNode; 
var
b: Integer; p: PNode;
begin
b := z; p := Root; {Bắt đầu với nút gốc, đối với RST thì gốc luôn có sẵn}
repeat
b := b - 1; {Xét bit b của X}
if <Bit b của X là 0> then p := p^.Left {Gặp 0 rẽ trái}
else p := p^.Right; {Gặp 1 rẽ phải}
until (p = nil) or (b = 0); RSTSearch := p;
end;', 15, 25, N'T02', N'9.8')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00064', N'Thủ tục chèn khoá X vào cây tìm kiếm cơ số. procedure RSTInsert(X: TKey); 
var
b: Integer; 
p, q: PNode;
begin
b := z; p := Root; {Bắt đầu từ nút gốc, đối với RST thì gốc luôn  nil}
repeat
b := b - 1; {Xét bit b của X}
q := p; {Khi p chạy xuống nút con thì q^ luôn giữ vai trò là nút cha của p^}
if <Bit b của X là 0> then p := p^.Left {Gặp 0 rẽ trái}
else p := p^.Right; {Gặp 1 rẽ phải}
if p = nil then {Không đi được thì đặt thêm nút để đi tiếp}
begin
New(p); {Tạo ra một nút mới và đem p trỏ tới nút đó}
p^.Left := nil; p^.Right := nil;
if <Bit b của X là 0> then q^.Left := p {Nối p^ vào bên trái q^}
else q^.Right := p; {Nối p^ vào bên phải q^}
end; 
until b = 0;
p^.Info := X; {p^ là nút lá để đặt X vào}
end;', 31, 51, N'T03', N'9.8')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00065', N'Thủ tục xoá khoá X vào cây tìm kiếm cơ số. {Thủ tục xoá khoá X khỏi cây tìm kiếm cơ số}
procedure RSTDelete(X: TKey); 
var
b: Integer;
p, q, TurnNode, Child: PNode; 
begin
{Trước hết, tìm kiếm giá trị X xem nó nằm ở nút nào}
b := z; p := Root; 
repeat
b := b - 1;
q := p; {Mỗi lần p chuyển sang nút con, ta luôn đảm bảo cho q^ là nút cha của p^}
if <Bit b của X là 0> then p := p^.Left 
else p := p^.Right;
if (b = z - 1) or (q^.Left  nil) and (q^.Right  nil) then {q^ là nút ngã ba}
begin
TurnNode := q; Child := p; {Ghi nhận lại q^ và hướng rẽ}
end;
until (p = nil) or (b = 0);
if p = nil then Exit; {X không tồn tại trong cây thì không xoá được}
{Trước hết, cắt nhánh độc đạo ra khỏi cây}
if TurnNode^.Left = Child then TurnNode^.Left := nil 
else TurnNode^.Right := nil
p := Child; {Chuyển sang đoạn đường độc đạo, bắt đầu xoá}
repeat
q := p;
{Lưu ý rằng p^ chỉ có tối đa một nhánh con mà thôi, cho p trỏ sang nhánh con duy nhất nếu có}
if p^.Left ¹ nil then p := p^.Left else p := p^.Right;
Dispose(q); {Giải phóng bộ nhớ cho nút q^}
until p = nil; 
end;', 56, 85, N'T03', N'9.8')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00066', N'Cây tìm kiếm số học. Xét dãy khoá k1, k2, …, kn là các số tự nhiên, mỗi giá trị khoá khi đổi ra hệ nhị phân có z chữ số nhị phân (bit), các bit này được đánh số từ 0 (là hàng đơn vị) tới z - 1 từ phải sang trái.
Ví dụ:
Image
Đánh số các bit

Cây tìm kiếm số học chứa các giá trị khoá này có thể mô tả như sau: Trước hết, nó là một cây nhị phân mà mỗi nút chứa một giá trị khoá. Nút gốc có tối đa hai cây con, ngoài giá trị khoá chứa ở nút gốc, tất cả những giá trị khoá có bit cao nhất là 0 nằm trong cây con trái, còn tất cả những giá trị khoá có bit cao nhất là 1 nằm ở cây con phải. Đối với hai nút con của nút gốc, vấn đề tương tự đối với bit z - 2 (bit đứng thứ nhì từ trái sang).', 1, 6, N'T01', N'9.7')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00067', N'Tìm kiếm tuần tự. Tìm kiếm tuần tự là một kỹ thuật tìm kiếm đơn giản. Nội dung của nó như sau: Bắt đầu từ bản ghi đầu tiên, lần lượt so sánh khoá tìm kiếm với khoá tương ứng của các bản ghi trong danh sách, cho tới khi tìm thấy bản ghi mong muốn hoặc đã duyệt hết danh sách mà chưa thấy', 1, 1, N'T01', N'9.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00068', N'Tìm kiếm nhị phân. Phép tìm kiếm nhị phân có thể áp dụng trên dãy khoá đã có thứ tự: k1 £ k2 £ … £ kn.
Giả sử ta cần tìm trong đoạn kinf, kinf+1, …, ksup với khoá tìm kiếm là X, trước hết ta xét khoá nằm giữa dãy kmedian với median = (inf + sup) div 2;
Nếu kmedian < X thì có nghĩa là đoạn từ kinf tới kmedian chỉ chứa toàn khoá < X, ta tiến hành tìm kiếm tiếp với đoạn từ kmedian + 1 tới ksup.
Nếu kmedian > X thì có nghĩa là đoạn từ kmedian tới ksup chỉ chứa toàn khoá > X, ta tiến hành tìm kiếm tiếp với đoạn từ kinf tới kmedian - 1.
Nếu kmedian = X thì việc tìm kiếm thành công (kết thúc quá trình tìm kiếm).
Quá trình tìm kiếm sẽ thất bại nếu đến một bước nào đó, đoạn tìm kiếm là rỗng (inf > sup).', 1, 6, N'T01', N'9.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00069', N'Cây nhị phân tìm kiếm. Cho n khoá k1, k2, …, kn, trên các khoá có quan hệ thứ tự toàn phần. Cây nhị phân tìm kiếm ứng với dãy khoá đó là một cây nhị phân mà mỗi nút chứa giá trị một khoá trong n khoá đã cho, hai giá trị chứa trong hai nút bất kỳ là khác nhau. Đối với mọi nút trên cây, tính chất sau luôn được thoả mãn:
⦁	Mọi khoá nằm trong cây con trái của nút đó đều nhỏ hơn khoá ứng với nút đó.
⦁	Mọi khoá nằm trong cây con phải của nút đó đều lớn hơn khoá ứng với nút đó
Image
Cây nhị phân tìm kiếm', 1, 5, N'T01', N'9.4')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00070', N'Sắp xếp kiểu chọn. Một trong những thuật toán sắp xếp đơn giản nhất là phương pháp sắp xếp kiểu chọn. Ý tưởng cơ bản của cách sắp xếp này là:
Ở lượt thứ nhất, ta chọn trong dãy khoá k1, k2, …, kn ra khoá nhỏ nhất (khoá £ mọi khoá khác) và đổi giá trị của nó với k1, khi đó giá trị khoá k1 trở thành giá trị khoá nhỏ nhất.
Ở lượt thứ hai, ta chọn trong dãy khoá k2, …, kn ra khoá nhỏ nhất và đổi giá trị của nó với k2.
…
Ở lượt thứ i, ta chọn trong dãy khoá ki, ki+1, …, kn ra khoá nhỏ nhất và đổi giá trị của nó với ki.
…
Làm tới lượt thứ n - 1, chọn trong hai khoá kn-1, kn ra khoá nhỏ nhất và đổi giá trị của nó với kn-1.', 1, 7, N'T01', N'8.2')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00071', N'Sắp xếp nổi bọt. Trong thuật toán sắp xếp nổi bọt, dãy các khoá sẽ được duyệt từ cuối dãy lên đầu dãy (từ kn  về k1), nếu gặp hai khoá kế cận bị ngược thứ tự thì đổi chỗ của chúng cho nhau. Sau lần duyệt như vậy, phần tử nhỏ nhất trong dãy khoá sẽ được chuyển về vị trí đầu tiên và vấn đề trở thành sắp xếp dãy khoá từ k2 tới kn:', 1, 1, N'T01', N'8.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00072', N'Sắp xếp kiểu chèn. Xét dãy khoá k1, k2, …, kn. Ta thấy dãy con chỉ gồm mỗi một khoá là k1 có thể coi là đã sắp xếp rồi. Xét thêm k2, ta so sánh nó với k1, nếu thấy k2 < k1 thì chèn nó vào trước k1. Đối với k3, ta lại xét dãy chỉ gồm 2 khoá k1, k2 đã sắp xếp và tìm cách chèn k3 vào dãy khoá đó để được thứ tự sắp xếp. Một cách tổng quát, ta sẽ sắp xếp dãy k1, k2, …, ki trong điều kiện dãy k1, k2, …, ki-1 đã sắp xếp rồi bằng cách chèn ki vào dãy đó tại vị trí đúng khi sắp xếp.', 1, 1, N'T01', N'8.4')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00073', N'Shellsort. Nhược điểm của thuật toán sắp xếp kiểu chèn thể hiện khi mà ta luôn phải chèn một khóa vào vị trí gần đầu dãy. Trong trường hợp đó, người ta sử dụng phương pháp ShellSort.
Xét dãy khoá: k1, k2, …, kn. Với một số nguyên dương h: 1 £ h £ n, ta có thể chia dãy đó thành h dãy con:
Dãy con 1: k1, k1+h, k1 + 2h, … 
Dãy con 2: k2, k2+h, k2 + 2h, …
…
Dãy con h: kh, k2h, k3h, …

Ví dụ như dãy (4, 6, 7, 2, 3, 5, 1, 9, 8); n = 9; h = 3. Có 3 dãy con.
Dãy các khoá chính: 4  6  7  2  3  5  1  9  8
Dãy con 1:                4          2          1
Dãy con 2:                    6          3          9
Dãy con 3:                        7          5          8
Những dãy con như vậy được gọi là dãy con xếp theo độ dài bước h. Tư tưởng của thuật toán ShellSort là: Với một bước h, áp dụng thuật toán sắp xếp kiểu chèn từng dãy con độc lập để làm mịn dần dãy khoá chính. Rồi lại làm tương tự đối với bước h div 2 … cho tới khi h = 1 thì ta được dãy khoá sắp xếp.
Như ở ví dụ trên, nếu dùng thuật toán sắp xếp kiểu chèn thì khi gặp khoá k7 = 1, là khoá nhỏ nhất trong dãy khoá, nó phải chèn vào vị trí 1, tức là phải thao tác trên 6 khoá đứng trước nó. Nhưng nếu coi 1 là khoá của dãy con 1 thì nó chỉ cần chèn vào trước 2 khoá trong dãy con đó mà thôi. Đây chính là nguyên nhân ShellSort hiệu quả hơn sắp xếp chèn: Khoá nhỏ được nhanh chóng đưa về gần vị trí đúng của nó.', 1, 14, N'T01', N'8.5')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00074', N'Heapsort. Đầu tiên, dãy khoá k1, k2, …, kn được vun từ dưới lên để nó biểu diễn một đống, khi đó khoá k1 tương ứng với nút gốc của đống là khoá lớn nhất, ta đảo giá trị khoá đó cho kn và không tính tới kn nữa. Còn lại dãy khoá k1, k2, …, kn-1 tuy không còn là biểu diễn của một đống nữa nhưng nó lại biểu diễn cây nhị phân hoàn chỉnh mà hai nhánh cây ở nút thứ 2 và nút thứ 3 (hai nút con của nút 1) đã là đống rồi. Vậy chỉ cần vun một lần, ta lại được một đống, đảo giá trị k1 cho kn-1 và tiếp tục cho tới khi đống chỉ còn lại 1 nút.
Ví dụ:
Image
Đảo giá trị k1 cho kn và xét phần còn lại
Image
Vun phần còn lại thành đống rồi lại đảo trị k1 cho kn-1
Thuật toán HeapSort có hai thủ tục chính:
Thủ tục Adjust(root, endnode) vun cây gốc root thành đống trong điều kiện hai cây gốc 2.root và 2.root +1 đã là đống rồi. Các nút từ endnode + 1 tới n đã nằm ở vị trí đúng và không được tính tới nữa.
Thủ tục HeapSort mô tả lại quá trình vun đống và chọn phần tử theo ý tưởng trên:', 14, 22, N'T01', N'8.7')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00075', N'Bài tập về đệ quy. Bài 1
Viết một hàm đệ quy tính ước số chung lớn nhất của hai số tự nhiên a, b không đồng thời bằng 0, chỉ rõ đâu là phần neo, đâu là phần đệ quy.
Bài 2
Viết một hàm đệ quy tính Image theo công thức truy hồi sau:
Image = Image = 1
Với 0 < k < n: Image = Image + Image
Bài 3
Nêu rõ các bước thực hiện của giải thuật cho bài Tháp Hà Nội trong trường hợp n = 3. Viết chương trình giải bài toán Tháp Hà Nội không đệ quy
', 1, -1, N'T05', N'3.5')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00076', N'Bài tập về danh sách. Bài 1
Lập chương trình quản lý danh sách học sinh, tuỳ chọn loại danh sách cho phù hợp, chương trình có những chức năng sau: (Hồ sơ một học sinh giả sử có: Tên, lớp, số điện thoại, điểm TB …)
Cho phép nhập danh sách học sinh từ bàn phím hay từ file. Cho phép in ra danh sách học sinh gồm có tên và xếp loại Cho phép in ra danh sách học sinh gồm các thông tin đầy đủ
Cho phép nhập vào từ bàn phím một tên học sinh và một tên lớp, tìm xem có học sinh có tên nhập vào trong lớp đó không ? Nếu có thì in ra số điện thoại của học sinh đó
Cho phép vào một hồ sơ học sinh mới từ bàn phím, bổ sung học sinh đó vào danh sách học sinh, in ra danh sách mới.
Cho phép nhập vào từ bàn phím tên một lớp, loại bỏ tất cả các học sinh của lớp đó khỏi danh sách, in ra danh sách mới.
Có chức năng sắp xếp danh sách học sinh theo thứ tự giảm dần của điểm trung bình
Cho phép nhập vào hồ sơ một học sinh mới từ bàn phím, chèn học sinh đó vào danh sách mà không làm thay đổi thứ tự đã sắp xếp, in ra danh sách mới.
Cho phép lưu trữ lại trên đĩa danh sách học sinh khi đã thay đổi.
Bài 2
Có n người đánh số từ 1 tới n ngồi quanh một vòng tròn (n £ 10000), cùng chơi một trò chơi: Một người nào đó đếm 1, người kế tiếp, theo chiều kim đồng hồ đếm 2… cứ như vậy cho tới người đếm đến một số nguyên tố thì phải ra khỏi vòng tròn, người kế tiếp lại đếm bắt đầu từ 1: Hãy lập chương trình
Nhập vào 2 số n và S từ bàn phím
Cho biết nếu người thứ nhất là người đếm 1 thì người còn lại cuối cùng trong vòng tròn là người thứ mấy
Cho biết nếu người còn lại cuối cùng trong vòng tròn là người thứ k thì người đếm 1 là người nào ?
Giải quyết hai yêu cầu trên trong trường hợp: đầu tiên trò chơi được đếm theo chiều kim đồng hồ, khi có một người bị ra khỏi cuộc chơi thì vẫn là người kế tiếp đếm 1 nhưng quá trình đếm ngược lại (tức là ngược chiều kim đồng hồ)', 1, -1, N'T05', N'4.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00077', N'Bài tập về ngăn xếp và hàng đợi. Bài 1
Tìm hiểu cơ chế xếp chồng của thủ tục đệ quy, phương pháp dùng ngăn xếp để khử đệ quy. Viết chương trình mô tả cách đổi cơ số từ hệ thập phân sang hệ cơ số R dùng ngăn xếp
Bài 2
Hình dưới đây là cơ cấu đường tàu tại một ga xe lửa
Image
Di chuyển toa tàu
Ban đầu ở đường ray A chứa các toa tàu đánh số từ 1 tới n theo thứ tự từ trái qua phải, người ta muốn chuyển các toa đó sang đường ray C để được một thứ tự mới là một hoán vị của (1,  2, …, n) theo quy tắc: chỉ được đưa các toa tàu chạy theo đường ray theo hướng mũi tên, có thể dùng đoạn đường ray B để chứa tạm các toa tàu trong quá trình di chuyển.
a) Hãy nhập vào hoán vị cần có, cho biết có phương án chuyển hay không, và nếu có hãy đưa ra cách chuyển:
Ví dụ: n = 4; Thứ tự cần có (1, 4, 3, 2)
1) A →  C; 2) A → B; 3) A → B; 4) A →  C; 5) B → C; 6) B →  C
b) Những hoán vị nào của thứ tự các toa là có thể tạo thành trên đoạn đường ray C với luật di chuyển như trên
Bài 3
Tương tự như bài 2, nhưng với sơ đồ đường ray sau:
Image
Di chuyển toa tàu (2)', 1, -1, N'T05', N'5.3')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00078', N'Bài tập về cây. Bài 1
Viết chương trình mô tả cây nhị phân dùng cấu trúc liên kết, mỗi nút chứa một số nguyên, và viết các thủ tục duyệt trước, giữa, sau.
Bài 2
Chứng minh rằng nếu cây nhị phân có x nút lá và y nút cấp 2 thì x = y + 1 
Bài 3
Chứng minh rằng nếu ta biết dãy các nút được thăm của một cây nhị phân khi duyệt theo thứ tự trước và thứ tự giữa thì có thể dựng được cây nhị phân đó. Điều này con đúng nữa không đối với thứ tự trước và thứ tự sau? Với thứ tự giữa và thứ tự sau.
Bài 4
Viết các thủ tục duyệt trước, giữa, sau không đệ quy.', 1, -1, N'T05', N'6.7')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00079', N'Bài tập về biểu thức. Bài 1
Viết chương trình chuyển biểu thức trung tố sang dạng RPN, biểu thức trung tố có cả những phép toán một ngôi: Phép lấy số đối (-x), phép luỹ thừa xy (x^y), lời gọi hàm số học (sqrt, exp, abs v.v…)
Bài 2
Viết chương trình chuyển biểu thức logic dạng trung tố sang dạng RPN. Ví dụ: Chuyển: a and b or c and d thành: a b and c d and or
Bài 3
Chuyển các biểu thức sau đây ra dạng RPN
a) A * (B + C) b) A + B / C + D
c) A * (B + -C)	
d) A - (B + C)d/e
e) A and B or C	
f) A and (B or not C)
g) (A or B) and (C or (D and not E))	
h) (A = B) or (C = D)
i) (A < 9) and (A > 3) or not (A > 0)
j) ((A > 0) or (A < 0)) and (B * B - 4 * A * C < 0)
Bài 4
Viết chương trình tính biểu thức logic dạng RPN với các toán tử and, or, not và các toán hạng là TRUE hay FALSE.
Bài 5
Viết chương trình hoàn chỉnh tính giá trị biểu thức trung tố.
', 1, -1, N'T05', N'7.6')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00080', N'Bài tập về sắp xếp. Bài 1
Viết thuật toán QuickSort không đệ quy 
Bài 2
Hãy viết những thuật toán sắp xếp nêu trên với danh sách những xâu ký tự gồm 3 chữ cái thường, để sắp xếp chúng theo thứ tự từ điển.
Bài 3
Hãy viết lại tất cả những thuật toán nêu trên với phương pháp sắp xếp bằng chỉ số trên một dãy số cần sắp không tăng (giảm dần).
Bài 4
Cho một danh sách thí sinh gồm n người, mỗi người cho biết tên và điểm thi, hãy chọn ra m người điểm cao nhất. Giải quyết bằng thuật toán có độ phức tạp tính toán trung bình O(n)
Bài 5
Thuật toán sắp xếp bằng cơ số trực tiếp có ổn định không ? Tại sao ? 
Bài 6
Cài đặt thuật toán sắp xếp trộn hai đường tự nhiên 
Bài 7
Tìm hiểu phép trộn k đường và các phương pháp sắp xếp ngoài (trên tệp truy nhập tuần tự và tệp truy nhập ngẫu nhiên)', 1, -1, N'T05', N'8.14')
GO
INSERT [dbo].[noidungbaihoc] ([mand], [tennd], [batdau], [ketthuc], [maloai], [baiso]) VALUES (N'ND00081', N'Bài tập về tìm kiếm. Bài 1
Hãy thử viết một chương trình SearchDemo tương tự như chương trình SortDemo trong bài trước. Đồng thời viết thêm vào chương trình SortDemo ở bài trước thủ tục TreeSort và đánh giá tốc độ thực của nó.
Bài 2
Tìm hiểu các phương pháp tìm kiếm ngoài, cấu trúc của các B_cây 
Bài 3
Tìm hiểu các phương pháp tìm kiếm chuỗi, thuật toán BRUTE-FORCE, thuật toán KNUTH- MORRIS-PRATT, thuật toán BOYER-MOORE và thuật toán RABIN-KARP
Tuy gọi là chuyên đề về "Cấu trúc dữ liệu và giải thuật" nhưng thực ra, ta mới chỉ tìm hiểu qua về hai dạng cấu trúc dữ liệu hay gặp là danh sách và cây, cùng với một số thuật toán mà "đâu cũng phải có" là tìm kiếm và sắp xếp. Không một tài liệu nào có thể đề cập tới mọi cấu trúc dữ liệu và giải thuật bởi chúng quá phong phú và liên tục được bổ sung. Những cấu trúc dữ liệu và giải thuật không "phổ thông" lắm như lý thuyết đồ thị, hình học, v.v… sẽ được tách ra và sẽ được nói kỹ hơn trong một chuyên đề khác.
Việc đi sâu nghiên cứu những cấu trúc dữ liệu và giải thuật, dù chỉ là một phần nhỏ hẹp cũng nảy sinh rất nhiều vấn đề hay và khó, như các vấn đề lý thuyết về độ phức tạp tính toán, vấn đề NP_đầy đủ v.v… Đó là công việc của những nhà khoa học máy tính. Nhưng trước khi trở thành một nhà khoa học máy tính thì điều kiện cần là phải biết lập trình. Vậy nên khi tìm hiểu bất cứ cấu trúc dữ liệu hay giải thuật nào, nhất thiết ta phải cố gắng cài đặt bằng được. Mọi ý tưởng hay sẽ chỉ là bỏ đi nếu như không biến thành hiệu quả, thực tế là như vậy.', 1, -1, N'T05', N'9.10')
GO
ALTER TABLE [dbo].[noidungbaihoc] ADD  DEFAULT ((1.1)) FOR [baiso]
GO
ALTER TABLE [dbo].[baihoc]  WITH CHECK ADD FOREIGN KEY([chuongso])
REFERENCES [dbo].[chuong] ([chuongso])
GO
ALTER TABLE [dbo].[noidungbai_nhan]  WITH CHECK ADD  CONSTRAINT [FK_noidungbai_nhan_nhan] FOREIGN KEY([manhan])
REFERENCES [dbo].[nhan] ([manhan])
GO
ALTER TABLE [dbo].[noidungbai_nhan] CHECK CONSTRAINT [FK_noidungbai_nhan_nhan]
GO
ALTER TABLE [dbo].[noidungbai_nhan]  WITH CHECK ADD  CONSTRAINT [FK_noidungbai_nhan_noidungbaihoc] FOREIGN KEY([mand])
REFERENCES [dbo].[noidungbaihoc] ([mand])
GO
ALTER TABLE [dbo].[noidungbai_nhan] CHECK CONSTRAINT [FK_noidungbai_nhan_noidungbaihoc]
GO
ALTER TABLE [dbo].[noidungbaihoc]  WITH CHECK ADD  CONSTRAINT [FK_noidungbaihoc_baihoc] FOREIGN KEY([baiso])
REFERENCES [dbo].[baihoc] ([baiso])
GO
ALTER TABLE [dbo].[noidungbaihoc] CHECK CONSTRAINT [FK_noidungbaihoc_baihoc]
GO
ALTER TABLE [dbo].[noidungbaihoc]  WITH CHECK ADD  CONSTRAINT [FK_noidungbaihoc_loainoidung] FOREIGN KEY([maloai])
REFERENCES [dbo].[loainoidung] ([maloai])
GO
ALTER TABLE [dbo].[noidungbaihoc] CHECK CONSTRAINT [FK_noidungbaihoc_loainoidung]
GO
