# Release notes

## v1.1.0 - Portfolio-ready slide deck

Phiên bản này tập trung làm repo slide dễ đọc hơn cho HR, kỹ sư review và người xem portfolio.

### Thay đổi chính

| Nhóm thay đổi | Nội dung |
| --- | --- |
| README | Viết lại bằng tiếng Việt, thêm tóm tắt kỹ thuật, link nhanh, slide map, cách build và phạm vi trung thực |
| Visual | Thêm banner SVG motion-safe, GIF motion tự host và ảnh preview slide 1 xuất từ build thật |
| Release asset | Chuẩn bị PDF build từ `main.typ` và gói source zip để tải trực tiếp từ GitHub Releases |
| Repo hygiene | Thêm `.gitattributes` để quản lý text/binary rõ hơn cho `.typ`, `.svg`, ảnh, GIF và font |
| Portfolio | Mô tả repo theo hướng bằng chứng kỹ thuật: DE10-Standard, HPS/Linux, TCP/Ethernet, FPGA HEX và Typst/Touying |

### Kiểm tra build

```bash
typst compile main.typ Slide-DoAnHTN-Nhom17-DE10Standard.pdf
typst compile main.typ assets/slide-preview-01.png --pages 1 --ppi 96
```

Kết quả: build PDF và PNG thành công. Typst có cảnh báo fallback cho một vài font phụ như `Liberation Serif`, `DejaVu Serif` và `Liberation Mono`; deck vẫn xuất bình thường trên Windows nhờ font hệ thống.

## v1.0.0 - Initial release

Phiên bản đầu tiên đưa source slide Typst/Touying, theme Stargazer, ảnh demo thật và release PDF cho đồ án SoC Ethernet TCP trên DE10-Standard.
