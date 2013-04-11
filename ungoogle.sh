#! /usr/bin/env bash
sudo tcpdump -i wlan0 host google.com or dst 46.51.197.89 or dst 46.51.197.88 | python ungoogle.py
