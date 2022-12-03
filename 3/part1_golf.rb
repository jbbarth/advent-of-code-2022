p File.readlines("input").map{_1=~/.{#{_1.size/2}}/
$&=~/[#{$'}]/
$&.ord-($&.ord>96&&96||38)}.sum
