#set page(
  width: 13.333in,
  height: 7.5in,
  margin: (x: 0.55cm, y: 0.42cm),
  fill: white,
)
#set text(
  font: ("Times New Roman", "Liberation Serif", "DejaVu Serif", "New Computer Modern"),
  lang: "vi",
  size: 13.1pt,
  fill: rgb("#111111"),
)
#set par(justify: false, leading: 1.02em)
#show strong: set text(weight: "bold")

#let dark = rgb("#083b4c")
#let mid = rgb("#246d7c")
#let line = rgb("#7da8b3")
#let soft = rgb("#f4f7f8")
#let soft-blue = rgb("#eef6f8")
#let soft-gold = rgb("#fbf5e8")
#let soft-rose = rgb("#faf1f4")
#let soft-green = rgb("#eff7f0")
#let ink-soft = luma(38%)

#let title-text(txt) = text(20.8pt, weight: "bold", fill: white)[#txt]
#let tiny(txt, fill: dark) = text(9.8pt, fill: fill)[#txt]
#let mono(txt, size: 10.4pt) = text(font: ("DejaVu Sans Mono", "Liberation Mono", "Courier New"), size: size)[#txt]

#let badge(label) = block(
  breakable: false,
  fill: white,
  stroke: (paint: mid, thickness: 0.75pt),
  inset: (x: 8pt, y: 3pt),
  radius: 999pt,
)[#text(10.1pt, weight: "bold", fill: dark)[#label]]

#let panel(title, body, fill: white) = block(
  width: 100%,
  breakable: false,
  fill: fill,
  stroke: (paint: line, thickness: 0.8pt),
  inset: (x: 10pt, y: 8pt),
  radius: 7pt,
)[
  #text(11.3pt, weight: "bold", fill: dark)[#title]
  #v(2pt)
  #body
]

#let phase(title, body, fill: soft-blue) = block(
  width: 100%,
  breakable: false,
  fill: fill,
  stroke: (paint: line, thickness: 0.8pt),
  inset: (x: 7pt, y: 7pt),
  radius: 7pt,
)[
  #align(center)[
    #text(10.9pt, weight: "bold", fill: dark)[#title]
    #v(2pt)
    #text(10.0pt)[#body]
  ]
]

#let step(tag, body, fill: white) = block(
  width: 100%,
  breakable: false,
  fill: fill,
  stroke: (paint: line, thickness: 0.8pt),
  inset: (x: 8pt, y: 7pt),
  radius: 6pt,
)[
  #text(10.9pt, weight: "bold", fill: dark)[#tag]
  #v(1pt)
  #body
]

#let title-band(title) = [
  #rect(width: 100%, height: 0.32cm, fill: dark)
  #block(width: 100%, fill: mid, inset: (x: 13pt, y: 5pt), breakable: false)[
    #title-text(title)
  ]
]

#let footer(no, total: 10) = [
  #v(1fr)
  #rect(width: 100%, height: 0.28cm, fill: dark)
  #block(width: 100%, fill: mid, inset: (x: 10pt, y: 2.5pt), breakable: false)[
    #grid(
      columns: (auto, 1fr, auto, auto),
      gutter: 10pt,
      align: center + horizon,
      [#tiny([Nhóm 17], fill: white)],
      [#align(center)[#tiny([SoC - Ethernet TCP trên DE10-Standard], fill: white)]],
      [#tiny([04/2026], fill: white)],
      [#tiny([#no / #total], fill: white)],
    )
  ]
]

#let std-slide(no, title, body, total: 10) = [
  #title-band(title)
  #v(0.18cm)
  #body
  #footer(no, total: total)
]

// -----------------------------------------------------------------------------
// Slide 1 - cover
#rect(width: 100%, height: 0.42cm, fill: dark)
#v(0.06cm)
#grid(
  columns: (auto, auto, 1fr, auto),
  gutter: 8pt,
  align: center + horizon,
  [#image("images/logo_vnuhcm.png", width: 2.42cm)],
  [#image("images/logo_us.png", width: 2.22cm)],
  [#align(center)[
    #text(9.3pt)[ĐẠI HỌC QUỐC GIA THÀNH PHỐ HỒ CHÍ MINH \ TRƯỜNG ĐẠI HỌC KHOA HỌC TỰ NHIÊN \ KHOA ĐIỆN TỬ - VIỄN THÔNG]
  ]],
  [#image("images/logo-fetel.png", width: 5.44cm)],
)
#v(0.08cm)
#grid(
  columns: (0.82fr, 1.18fr),
  gutter: 13pt,
  align: top + left,
  [
    #text(10.9pt, weight: "bold", fill: dark)[THỰC HÀNH HỆ THỐNG NHÚNG - 22DTV_CLC]
    #v(2pt)
    #text(22.0pt, weight: "bold", fill: dark)[SOC - ETHERNET TRÊN DE10-STANDARD]
    #v(2pt)
    #text(11.7pt, style: "italic", fill: ink-soft)[Nhánh TCP end-to-end giữa HPS Linux, client và cụm HEX]
    #v(4pt)
    #badge([TCP only]) #h(3pt)
    #badge([Port 5000]) #h(3pt)
    #badge([Desktop + Android]) #h(3pt)
    #badge([Demo 15 phút])
    #v(5pt)
    #panel([Thông điệp cốt lõi], [
      *Boot Linux* -> *eth0 có IP* -> *nhận lệnh TCP* -> *ghi ra 6 HEX*.
    ], fill: soft-gold)
  ],
  [
    #align(center)[#image("assets/photo_phone_board_wide.jpg", height: 6.70cm)]
    #v(6pt)
    #grid(
      columns: (1fr),
      row-gutter: 5pt,
      [#panel([Giảng viên], [#text(8.85pt)[ThS. Trần Tuấn Kiệt, ThS. Đỗ Quốc Minh Đăng, ThS. Nguyễn Như Hoàng]], fill: soft)],
      [#panel([Nhóm 17], [#text(8.70pt)[Văn Đình Nam, Lương Hải Long, Trần Sĩ Nam, Lê Tấn Phi Pha, Vũ Châu Thắng Lợi]], fill: white)],
      [#panel([Chuỗi minh chứng], [#align(center)[#text(9.7pt, weight: "bold", fill: dark)[Boot -> eth0 / IP -> TCP:5000 -> `hex_text.sh` -> HEX]]], fill: soft-rose)],
      [#panel([Trục bảo vệ], [#text(9.7pt)[*TCP only* - *run thật* - *ít chữ* - *ưu tiên ảnh demo*.]], fill: soft-blue)],
    )
  ],
)
#pagebreak()

// -----------------------------------------------------------------------------
// Slide 2 - scope
#std-slide(2, [Phạm vi bảo vệ và tuyến demo], [
  #grid(
    columns: (0.78fr, 1.22fr),
    gutter: 16pt,
    align: top + left,
    [
      #panel([1. Bám đúng đề], [
        Vẫn đủ ba lớp: *tích hợp hệ thống*, *lớp điều khiển trên board* và *ứng dụng phía người dùng*.
      ], fill: soft-gold)
      #v(8pt)
      #panel([2. Bỏ toàn bộ SSH], [
        Chỉ giữ *TCP* để phần bảo vệ gọn, sạch và đúng phần đã chạy thật.
      ], fill: soft-blue)
      #v(8pt)
      #panel([3. Cách nói trong 15 phút], [
        *điều kiện nền* -> *lõi TCP* -> *hai đầu cuối* -> *ảnh chạy thật*.
      ], fill: soft-rose)
      #v(8pt)
      #panel([Tiêu chí thiết kế], [
        Ít chữ, ảnh thật là chính, sơ đồ chỉ giữ phần phục vụ trực tiếp cho demo.
      ], fill: soft)
    ],
    [
      #align(center)[#image("assets/photo_board_hex_main.png", height: 9.45cm)]
      #v(10pt)
      #align(center)[
        #grid(
          columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr),
          column-gutter: 4pt,
          align: center + horizon,
          [#phase([Boot], [Linux khởi động], fill: soft)],
          [#text(17pt, fill: dark)[->]],
          [#phase([eth0], [lấy IP], fill: soft-blue)],
          [#text(17pt, fill: dark)[->]],
          [#phase([TCP:5000], [client gửi text], fill: soft-gold)],
          [#text(17pt, fill: dark)[->]],
          [#phase([Sanitize], [lọc + chuẩn hóa], fill: soft-rose)],
          [#text(17pt, fill: dark)[->]],
          [#phase([HEX], [hiển thị tức thời], fill: soft-green)],
        )
      ]
    ],
  )
])
#pagebreak()

// -----------------------------------------------------------------------------
// Slide 3 - architecture
#std-slide(3, [Kiến trúc end-to-end của hệ thống], [
  #align(center)[
    #grid(
      columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr),
      column-gutter: 4pt,
      align: center + horizon,
      [#phase([1. Bring-up], [MicroSD + MSEL \ boot Linux], fill: soft-gold)],
      [#text(17pt, fill: dark)[->]],
      [#phase([2. Mạng], [UART-USB \ kiểm `eth0` và IP], fill: soft-blue)],
      [#text(17pt, fill: dark)[->]],
      [#phase([3. Client], [Desktop / Android \ gửi payload], fill: soft-rose)],
      [#text(17pt, fill: dark)[->]],
      [#phase([4. Board-side], [`board_tcp_hex_server.py` \ gọi `hex_text.sh`], fill: soft-green)],
      [#text(17pt, fill: dark)[->]],
      [#phase([5. Hardware], [`devmem` -> PIO \ cập nhật 6 HEX], fill: soft)],
    )
  ]
  #v(0.18cm)
  #grid(
    columns: (0.84fr, 1.16fr),
    gutter: 16pt,
    align: top + left,
    [
      #align(center)[#image("assets/de10_standard.jpg", height: 50%)]
    ],
    [
      #panel([Ý nghĩa kiến trúc], [
        Desktop và Android chỉ khác ở *giao diện điều khiển*; mọi lệnh đều hội tụ về *cùng một đường dữ liệu TCP* trên board.
      ], fill: soft)
      #v(8pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 8pt,
        [#panel([HPS Linux], [Chạy shell, mạng và TCP server tối giản để nhận payload từ client.], fill: soft-blue)],
        [#panel([FPGA / PIO / HEX], [Là đích quan sát cuối cùng; kết quả được thấy trực tiếp trên cụm 7-segment.], fill: soft-gold)],
      )
      #v(8pt)
      #panel([Điểm nhấn khi bảo vệ], [
        Phần cần nhấn mạnh không phải số lượng tính năng, mà là *chuỗi end-to-end đã chạy ổn định* từ client đến phần cứng.
      ], fill: soft-rose)
    ],
  )
])
#pagebreak()

// -----------------------------------------------------------------------------
// Slide 4 - bring-up
#std-slide(4, [Nền tảng phần cứng và chuỗi bring-up], [
  #grid(
    columns: (0.86fr, 1.14fr),
    gutter: 16pt,
    align: top + left,
    [
      #align(center)[#image("assets/photo_laptop_board_close.png", height: 50%)]
      #v(8pt)
      #panel([Nhận định], [
        Nếu nền chưa ổn định thì mọi kết quả ở tầng TCP và tầng ứng dụng đều *chưa đủ tin cậy*.
      ], fill: soft)
    ],
    [
      #grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 8pt,
        [#panel([Boot], [MSEL đúng, MicroSD đủ thành phần], fill: soft-gold)],
        [#panel([Console], [USB-UART của HPS phải vào được shell], fill: soft-blue)],
        [#panel([Network], [`eth0` phải lên IP trước khi mở server], fill: soft-rose)],
      )
      #v(8pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 8pt,
        [#step([B1], [Nguồn - MSEL - MicroSD - cáp UART], fill: soft-gold)],
        [#step([B2], [Boot Linux và đăng nhập shell qua serial], fill: soft-gold)],
        [#step([B3], [#mono("ifconfig eth0 up") \ #mono("udhcpc -i eth0")], fill: soft-green)],
        [#step([B4], [Chạy `hex_text.sh`, sau đó mở TCP server], fill: soft-rose)],
      )
      #v(8pt)
      #grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 8pt,
        [#align(center)[#image("assets/msel.jpg", height: 1.55cm)]],
        [#align(center)[#image("assets/microsd_32gb.png", height: 1.55cm)]],
        [#align(center)[#image("assets/usb_uart_cable.png", height: 1.55cm)]],
      )
      #v(8pt)
      #panel([Giá trị học thuật], [
        Slide này cho thấy nhóm không chỉ demo giao diện, mà còn làm rõ *điều kiện vận hành* của một hệ SoC có Linux và Ethernet.
      ], fill: soft)
    ],
  )
])
#pagebreak()

// -----------------------------------------------------------------------------
// Slide 5 - tcp core
#std-slide(5, [Lõi TCP trên board: từ payload đến cụm HEX], [
  #align(center)[
    #grid(
      columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr),
      column-gutter: 4pt,
      align: center + horizon,
      [#phase([Client], [gửi text UTF-8 \ kèm newline], fill: soft-gold)],
      [#text(17pt, fill: dark)[->]],
      [#phase([TCP server], [listen + accept \ `SO_REUSEADDR`], fill: soft-blue)],
      [#text(17pt, fill: dark)[->]],
      [#phase([sanitize_text], [`strip` -> `upper` \ lọc ký tự hợp lệ], fill: soft-rose)],
      [#text(17pt, fill: dark)[->]],
      [#phase([`hex_text.sh`], [cắt / đệm 6 ký tự \ map 7-segment], fill: soft-green)],
      [#text(17pt, fill: dark)[->]],
      [#phase([PIO / HEX], [`devmem` ghi thanh ghi \ cập nhật cụm HEX], fill: soft)],
    )
  ]
  #v(0.18cm)
  #grid(
    columns: (0.9fr, 0.68fr, 0.72fr),
    gutter: 10pt,
    align: top + left,
    [
      #panel([Chi tiết bám mã nguồn], [
        Host lắng nghe: #mono("0.0.0.0") \
        Port: #mono("5000") \
        Phản hồi: #mono("OK:<text>") hoặc #mono("ERR:<msg>") \
        Chuẩn hóa lõi: #mono("s.strip().upper()") \
        Cắt / đệm: #mono("s[:6].ljust(6)")
      ], fill: soft)
    ],
    [
      #panel([Tập ký tự mục tiêu], [
        `0-9`, `A-Z`, `-`, `_`, khoảng trắng. \
        Ký tự ngoài tập cho phép sẽ bị thay bằng khoảng trắng.
      ], fill: soft-blue)
      #v(8pt)
      #panel([Script phía board], [
        #mono("sh /tmp/hex_text.sh <text>") \
        #mono("sh /tmp/start_board_tcp_hex_server.sh")
      ], fill: soft-gold)
    ],
    [
      #align(center)[#image("assets/photo_board_hex_main.png", height: 50%)]
    ],
  )
])
#pagebreak()

// -----------------------------------------------------------------------------
// Slide 6 - contract
#std-slide(6, [Contract dữ liệu và kiểm thử tối thiểu], [
  #grid(
    columns: (0.82fr, 1.18fr),
    gutter: 14pt,
    align: top + left,
    [
      #panel([Contract dữ liệu chung], [
        • Chuỗi được chuẩn hóa về *chữ in hoa*. \
        • Chỉ giữ: *A-Z*, *0-9*, `-`, `_` và khoảng trắng. \
        • Dài hơn sẽ bị *cắt còn 6 ký tự*. \
        • Ngắn hơn sẽ được *đệm khoảng trắng* để khớp 6 HEX.
      ], fill: soft-blue)
      #v(8pt)
      #panel([Điểm cần nhấn mạnh], [
        Đây là *một contract duy nhất* cho cả desktop và Android; nhờ đó đổi giao diện mà *không đổi lõi xử lý*.
      ], fill: soft-rose)
      #v(8pt)
      #panel([Ổn định khi demo], [
        Ký tự không hợp lệ *không làm vỡ luồng*; chúng được thay bằng khoảng trắng nên hệ thống vẫn giữ được tính ổn định khi thao tác trực tiếp.
      ], fill: soft)
    ],
    [
      #table(
        columns: (1.05fr, 1.05fr, 1.05fr),
        fill: (x, y) => if y == 0 { dark } else if x == 1 { soft-blue } else if x == 2 { soft-gold } else { white },
        stroke: (x: (paint: line, thickness: 0.7pt), y: (paint: line, thickness: 0.7pt)),
        inset: (x: 7pt, y: 6pt),
        table.header(
          [#text(10.9pt, weight: "bold", fill: white)[Input]],
          [#text(10.9pt, weight: "bold", fill: white)[Sau chuẩn hóa]],
          [#text(10.9pt, weight: "bold", fill: white)[Phản hồi]],
        ),
        [#mono("HELLO-")], [#mono("HELLO-")], [#mono("OK:HELLO-")],
        [#mono("abc123")], [#mono("ABC123")], [#mono("OK:ABC123")],
        [#mono("p-0001")], [#mono("P-0001")], [#mono("OK:P-0001")],
        [#mono("abc@12")], [#mono("ABC 12")], [#mono("OK:ABC 12")],
      )
      #v(10pt)
      #align(center)[#image("assets/photo_laptop_gui_real.png", height: 50%)]
    ],
  )
])
#pagebreak()

// -----------------------------------------------------------------------------
// Slide 7 - clients
#std-slide(7, [Hai đầu cuối điều khiển: Desktop và Android], [
  #grid(
    columns: (0.66fr, 0.34fr),
    gutter: 14pt,
    align: top + left,
    [#align(center)[#image("assets/tcp_gui_desktop.png", height: 50%)]],
    [#align(center)[#image("assets/tcp_gui_android_crop.jpg", height: 50%)]],
  )
  #v(8pt)
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 8pt,
    [#panel([Chung endpoint], [#text(10.9pt)[IP board + port `5000`]], fill: soft-blue)],
    [#panel([Chung payload], [#text(10.9pt)[Tối đa 6 ký tự, cùng contract dữ liệu]], fill: soft-gold)],
    [#panel([Chung phản hồi], [#text(10.9pt)[`OK / ERR` từ board-side service]], fill: soft-rose)],
    [#panel([Thông điệp], [#text(10.9pt)[Khác giao diện, cùng một lõi TCP duy nhất.]], fill: soft)],
  )
  #v(8pt)
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [#panel([Desktop GUI], [#text(10.9pt)[Phù hợp để demo nhanh, lặp lại test và quan sát phản hồi tức thời.]], fill: soft)],
    [#panel([Android client], [#text(10.9pt)[Cho thấy hệ thống không phụ thuộc vào một giao diện điều khiển duy nhất.]], fill: soft)],
  )
])
#pagebreak()

// -----------------------------------------------------------------------------
// Slide 8 - evidence
#std-slide(8, [Minh chứng chạy thật end-to-end], [
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 10pt,
    align: top + left,
    [#image("assets/photo_laptop_gui_real.png", width: 100%)],
    [#image("assets/photo_board_hex_main.png", width: 100%)],
    [#image("assets/photo_phone_board_main.png", width: 100%)],
  )
  #v(10pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    [#panel([Dấu hiệu 1], [Có endpoint, payload và thao tác gửi rõ ràng ở phía client.], fill: soft-gold)],
    [#panel([Dấu hiệu 2], [Board nhận lệnh và cập nhật cụm HEX ngay trong cùng một phiên chạy.], fill: soft-blue)],
    [#panel([Dấu hiệu 3], [Ngữ cảnh phần cứng, Ethernet và môi trường lab xuất hiện trực tiếp trong ảnh.], fill: soft-rose)],
  )
  #v(8pt)
  #panel([Kết luận từ ảnh thật], [
    Cả desktop lẫn Android đều hội tụ về cùng một endpoint TCP; phần hiển thị trên HEX thay đổi tức thời ngay trên board trong bối cảnh lab thật.
  ], fill: soft)
])
#pagebreak()

// -----------------------------------------------------------------------------
// Slide 9 - mapping
#std-slide(9, [Đối chiếu với yêu cầu học phần], [
  #grid(
    columns: (1.18fr, 0.82fr),
    gutter: 12pt,
    align: top + left,
    [
      #table(
        columns: (1.05fr, 1.6fr, 1.35fr),
        fill: (x, y) => if y == 0 { dark } else if x == 0 { soft-gold } else { white },
        stroke: (x: (paint: line, thickness: 0.7pt), y: (paint: line, thickness: 0.7pt)),
        inset: (x: 7pt, y: 6pt),
        table.header(
          [#text(10.8pt, weight: "bold", fill: white)[Yêu cầu]],
          [#text(10.8pt, weight: "bold", fill: white)[Phần đã hiện thực]],
          [#text(10.8pt, weight: "bold", fill: white)[Nhận định]],
        ),
        [*Tích hợp hệ thống*], [Boot Linux trên HPS, bring-up qua UART-USB, Ethernet và truy cập ngoại vi FPGA.], [Đạt ở mức nguyên mẫu chạy thật.],
        [*Lớp điều khiển*], [TCP server tối giản + `hex_text.sh` + ghi thanh ghi bằng `devmem`.], [Đủ để chứng minh lớp trung gian giữa app và phần cứng.],
        [*Ứng dụng phía người dùng*], [Desktop GUI và Android cùng gửi payload TCP về một endpoint chung.], [Giữ được contract dữ liệu thống nhất.],
      )
    ],
    [
      #panel([Giới hạn hiện tại], [
        • Còn phụ thuộc thời gian boot Linux. \
        • Chưa đi sâu vào đo đạc định lượng. \
        • Chủ động thu hẹp về nhánh TCP đã chạy thật.
      ], fill: soft-rose)
      #v(8pt)
      #panel([Kịch bản nói 15 phút], [
        • *Mở đề:* nêu TCP only và mục tiêu. \
        • *Bring-up:* chứng minh Linux, UART, `eth0`. \
        • *Lõi TCP:* chỉ ra contract và luồng dữ liệu. \
        • *Demo:* desktop / Android -> board -> HEX. \
        • *Kết:* bám đúng đề, chạy thật, đủ ba lớp.
      ], fill: soft)
    ],
  )
])
#pagebreak()

// -----------------------------------------------------------------------------
// Slide 10 - conclusion
#std-slide(10, [Kết luận], [
  #grid(
    columns: (0.66fr, 1.34fr),
    gutter: 16pt,
    align: top + left,
    [
      #panel([Kết luận cuối cùng], [
        Nhánh *TCP* đã chứng minh được một chuỗi *SoC - Ethernet* hoàn chỉnh trên *DE10-Standard*: *boot Linux* trên HPS, *lên mạng*, *nhận lệnh TCP* từ desktop hoặc Android, rồi *ghi dữ liệu ra cụm HEX* qua ngoại vi FPGA.
      ], fill: soft-blue)
      #v(10pt)
      #align(center)[
        #badge([Bám đúng đề]) #h(5pt)
        #badge([TCP only]) #h(5pt)
        #badge([Run thật]) #h(5pt)
        #badge([Demo 15 phút])
      ]
      #v(12pt)
      #panel([Sẵn sàng trao đổi], [
        Kiến trúc SoC, luồng TCP, bring-up và chiến lược kiểm thử theo từng tầng.
      ], fill: soft-gold)
    ],
    [
      #align(center)[#image("assets/photo_phone_board_alt.jpg", height: 50%)]
      #v(10pt)
      #align(center)[#text(23pt, weight: "bold", fill: dark)[Xin cảm ơn quý Thầy/Cô!]]
    ],
  )
])
