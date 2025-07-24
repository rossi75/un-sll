#!/bin/bash

# Konvertiert eine PCAP-Datei mit Linux Cooked Capture (SLL) zu Ethernet

# Eingabedatei prüfen
if [ -z "$1" ]; then
  echo "[Fehler] Bitte gib den Pfad zu einer PCAP-Datei an."
  echo "Nutzung: $0 input.pcap"
  exit 1
fi

INPUT="$1"
OUTPUT="${INPUT%.*}_ETH.pcap"

# Prüfen, ob tcprewrite vorhanden ist
if ! command -v tcprewrite >/dev/null 2>&1; then
  echo "[Fehler] tcprewrite ist nicht installiert. Bitte installiere es mit: sudo apt install tcpreplay"
  exit 1
fi

# Konvertieren
echo "[Info] Konvertiere $INPUT zu Ethernet-PCAP..."
tcprewrite --dlt=enet --infile="$INPUT" --outfile="$OUTPUT"

# Erfolg prüfen
if [ $? -eq 0 ]; then
  echo "[Erfolg] Datei gespeichert als: $OUTPUT"
else
  echo "[Fehler] Konvertierung fehlgeschlagen."
  exit 2
fi
