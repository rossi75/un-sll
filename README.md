# un-sll
removes the Linux-cooked capture element from a pcap, recorded with the tshark option "-i any"

# PCAP SLL to Ethernet Converter

This script converts a PCAP file captured in **Linux Cooked Capture (SLL)** format to **Ethernet (DLT_EN10MB)** format using `tcprewrite`. Makes things a lot easier for further analysis like SRTP decoding or similar

## 🛠️ Requirements

- `tcprewrite` (part of the `tcpreplay` package)

Install it via:

```bash
sudo apt install tcpreplay
