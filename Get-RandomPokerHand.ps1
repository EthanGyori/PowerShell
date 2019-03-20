param([int]$handSize = 5,[string]$cards)

$a='A'
$num=2..9
$jkq='J','K','Q'

$rank = $a+$num+$jkq
$suit='C','D','H','S'

$cards = @()

1..$handSize |%{$cards += get-card}
$cards | %{$_[0]} | group

rv cards
function get-card()
    {
        
        [string]$pickRank = $rank[(Get-Random -Maximum $rank.Length)]
        [string]$pickSuit = $suit[(Get-Random -Maximum $suit.Length)]
        [string]$card=$pickRank+$pickSuit
        return $card
    }
