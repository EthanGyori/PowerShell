#Given a "poker hand" calculate highest nubmer of occurses of a card, output only this number
param([string]$cards = "AH 2C 3S 4D")
($cards.split(" ") | %{$_[0]} | group |select -ExpandProperty count | Sort-Object -Descending)[0]
