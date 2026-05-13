<p align="center">
  <img src="docs/banner.svg" alt="SoC Ethernet TCP on DE10-Standard — Embedded Systems Capstone Group 17 — 22DTV_CLC HCMUS FETEL" width="100%" />
</p>

<h2 align="center">🖼️ Slide Đồ án Hệ Thống Nhúng — Nhóm 17 — 22DTV_CLC 🖼️</h2>

<p align="center">
  <img src="https://img.shields.io/badge/Typst-Stargazer%20Theme-239DAD?style=for-the-badge&logo=typst&logoColor=white" alt="Typst" />
  <img src="https://img.shields.io/badge/Slide-16%3A9%20Widescreen-2563eb?style=for-the-badge" alt="16:9" />
  <img src="https://img.shields.io/badge/Board-DE10--Standard%20Cyclone%20V%20SoC-0f766e?style=for-the-badge" alt="DE10" />
  <img src="https://img.shields.io/badge/Stack-FPGA%20%2B%20HPS%2FLinux%20%2B%20TCP%2FEthernet-083b4c?style=for-the-badge" alt="Stack" />
  <img src="https://img.shields.io/badge/Group-Nh%C3%B3m%2017-D95319?style=for-the-badge" alt="Group 17" />
</p>

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&size=18&duration=3200&pause=900&color=246D7C&center=true&vCenter=true&multiline=true&width=820&height=80&lines=From+TCP+packet+%E2%86%92+HPS%2FLinux+%E2%86%92+FPGA+fabric+%E2%86%92+LED+7+segment;Designed+with+Stargazer-style+Typst+slides+%E2%80%94+13.33in+%C3%97+7.5in" alt="Typing animation" />
</p>

---

## Tổng quan / About

Deck báo cáo cho **Đồ án Hệ thống nhúng — Nhóm 17 (22DTV_CLC)** chủ đề:

> **"SoC FPGA nhận lệnh TCP/Ethernet từ PC/Android, xử lý trên HPS/Linux và hiển thị lên LED 7 đoạn — DE10-Standard Cyclone V"**

Slide được **soạn bằng Typst** với theme **Stargazer** tự thiết kế (`stargazer.typ`):

- Trang `13.333in × 7.5in` widescreen 16:9 (giống PowerPoint slide chuẩn).
- Palette: `dark #083b4c` — `mid #246d7c` — `line #7da8b3` — soft pastels.
- Component library: `panel`, `phase`, `step`, `title-band`, `badge`, `footer` — toàn bộ là Typst function, render lại sạch khi sửa nội dung.
- Footer cố định: *Nhóm 17 — SoC - Ethernet TCP trên DE10-Standard — 04/2026 — N/total*.
- Image grid với photo board, laptop GUI, phone GUI, USB-UART, microSD, DE10-Standard.

## Demo / Preview

<table>
  <tr>
    <td align="center" width="33%">
      <img src="https://img.shields.io/badge/TCP-Sender-2563eb?style=flat-square" alt="TCP sender" /><br />
      <b>PC / Android</b><br />
      <sub>Python GUI · TCP client · gửi lệnh điều khiển 7-segment</sub>
    </td>
    <td align="center" width="33%">
      <img src="https://img.shields.io/badge/HPS%2FLinux-Bridge-0f766e?style=flat-square" alt="HPS" /><br />
      <b>HPS / Linux</b><br />
      <sub>ARM Cortex-A9 · Socket server · mmap → Avalon-MM master</sub>
    </td>
    <td align="center" width="33%">
      <img src="https://img.shields.io/badge/FPGA-Display-D95319?style=flat-square" alt="FPGA" /><br />
      <b>FPGA Fabric</b><br />
      <sub>Cyclone V · PIO IP · 7-segment decoder · LED out</sub>
    </td>
  </tr>
</table>

## Cây thư mục / Layout

```
.
├── main.typ                # Entry — set page (13.33×7.5in), set text, include all slides
├── stargazer.typ           # Theme: dark/mid palette + panel/phase/step/title-band/footer
├── assets/                 # Logo VNU-HCM, US (HCMUS), FETEL
└── images/                 # Board photos, laptop board close, phone GUI, USB-UART, microSD
```

## Build PDF

```bash
# Compile slide deck
typst compile main.typ Slide-DoAnHTN-Nhom17.pdf

# Hoặc xem live khi đang chỉnh
typst watch main.typ
```

> Font Times New Roman / DejaVu Sans Mono là *optional fallback* — Typst sẽ rơi về font có sẵn của OS nếu thiếu. Slide vẫn render đẹp.

Sau khi build, file `Slide-DoAnHTN-Nhom17-DE10Standard.pdf` (~21 MB, 10 slides 16:9) sẽ có sẵn để trình bày trên PowerPoint, OBS, Zoom hay in.

## Slide Map

| # | Slide                                       | Nội dung kỹ thuật                                                    |
| - | ------------------------------------------- | -------------------------------------------------------------------- |
| 1 | **Title**                                   | Tên đồ án, nhóm 17, GVHD, logo VNU-HCM/HCMUS/FETEL                   |
| 2 | **Bài toán &amp; yêu cầu**                  | Tại sao cần TCP→FPGA, các ràng buộc realtime                         |
| 3 | **Tổng quan kiến trúc**                     | PC/Android ↔ TCP/Ethernet ↔ HPS Linux ↔ Avalon-MM ↔ FPGA ↔ LED       |
| 4 | **DE10-Standard Cyclone V SoC**             | Photo board, MSEL, microSD boot, USB-UART debug                      |
| 5 | **Phía PC/Android**                         | GUI desktop Python, app Android nhập IP/port, gửi packet             |
| 6 | **Phía HPS/Linux**                          | Boot Linux từ microSD, socket server C, ánh xạ register Avalon-MM    |
| 7 | **Phía FPGA**                               | PIO IP, decoder 7-segment, timing, đầu ra GPIO LED                   |
| 8 | **Demo &amp; kết quả đo**                   | Photo board hex main, laptop board close, phone board main           |
| 9 | **Khó khăn — Bài học**                      | Bottleneck debug, boot loop, MSEL sai, cable USB-UART, IP conflict   |
| 10| **Kết luận &amp; hướng phát triển**         | Mở rộng giao thức (MQTT, websocket), thay LED bằng LCD/Touchscreen   |

## Liên quan / See also

- [`DoAnHeThongNhung`](https://github.com/lhlizdabezt/DoAnHeThongNhung) — **Source code đồ án** (Quartus, Python GUI, C apps, report PDF)
- [`embedded-systems-fpga-review-labs`](https://github.com/lhlizdabezt/embedded-systems-fpga-review-labs) — Lab workspace HTN (Verilog IP, Avalon-MM, Nios II, PIO/DMA)
- [`BCTT-ThucTap-BTPHoldings`](https://github.com/lhlizdabezt/BCTT-ThucTap-BTPHoldings) — Báo cáo Thực tập Thực tế 2026

## License

- Slide theme `stargazer.typ` + macros + layout: **MIT License** — xem [LICENSE](LICENSE).
- Nội dung kỹ thuật, kết luận và ảnh trong `images/` / `assets/`: © 2026 Lương Hải Long &amp; Nhóm 17 — 22DTV_CLC HCMUS. Không tái sử dụng cho mục đích thương mại hoặc nộp lại như đồ án của bạn.

<p align="center">
  <sub>Stargazer Typst theme · 16:9 widescreen · Made for HCMUS FETEL embedded-systems defense</sub>
</p>
