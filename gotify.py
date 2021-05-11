#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests, sys

ARGUMENTOS = len(sys.argv) - 1

if ARGUMENTOS < 3:
  print('Argumentos inválidos!')
  quit()

TOKEN = sys.argv[1]
TITULO = sys.argv[2]
MENSAGEM = sys.argv[3]

requests.post('https://YOUR_SERVER_WHERE/message?token=' + TOKEN, json={
  "message": MENSAGEM,
  "title": TITULO,
  "priority": 2
})
