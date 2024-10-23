use strict;
use warnings;

print "hello!\n";
# "C:\perlpractice\hello.pl"

my $price = 2000;
print $price;
print "\n";
print $price, "\n";
print "$price\n";

print $price * 0.8, "\n";
$price = 10000, "\n";
print $price, "\n";

# 変数はそのまま計算に使える。
# 変更はしれっとできる。既に$priceという変数名は使用済みなのでmyは不要。
# 確認のため、$priceがいくつか表示してみる。こういうのを「デバッグプリント」という。

my $discount_price = $price * 0.9;
print $discount_price;
print "\n";
print "値段は $price 円です。\n";
print "\$price is $price\n";
# 変数展開をするには、変数を示す$の前に\（￥）を添えるだけ。

# 別のPCでできるように設定中。