#! /usr/bin/env bash
sudo tcpdump -i wlan0 host google.com  | python ungoogle.py
