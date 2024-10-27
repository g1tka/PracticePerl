use strict;
use warnings;
use utf8;
use open ':std', ':utf8';
# portableshell.batのターミナルで「chcp 65001」の実行も

# キーと値 ← 名前と年齢の対応表
my %hash = (
    '渋沢栄一' => 36,
    '津田梅子' => 22,
    '北里柴三郎' => 21,
    '夏目漱石' => 22,
);
# %hashという変数、新しい記号！
# キー => 値
# 左辺に右辺を対応させる。
print $hash{'渋沢栄一'};
# >36

=pod
重要な特徴
１．キーは重複しない。すると上書き。
２．値は重複してもよい。
３．順番は無意味。
キーと値を区別することは重要。
=cut

foreach my $key (keys(%hash)) {
    my $value = $hash{$key};
    print "$key → $value\n";
}
# 渋沢栄一 → 36
# 北里柴三郎 → 21
# 津田梅子 → 22
# 夏目漱石 → 22
=pod
関数keys：ハッシュ%hashに含まれているすべてのキーからなるリストを返す。
ここでkeys(%hash)が返すリストは、('渋沢栄一', '北里柴三郎', '津田梅子', '夏目漱石')
順番はPerlがやりやすいように自動。ただ順番は無意味。
foreachでこのリスト要素を一つずつ$keyにセットして繰り返しを行う。

foreach my $key (keys %hash) {
    print "$key → $hash{$key}\n";
}
これは、keys(%hash)のカッコを省略したもの。
デフォルト変数をつかえば……
foreach  (keys %hash) {
    print "$_ → $hash{$_}\n";
}
これは以下と同じ。$_を省略できる。
foreach $_ (keys %hash) {
    print "$_ → $hash{$_}\n";
}
再度。
foreach my $key (keys(%hash)) {
    my $value = $hash{$key};
    print "$key → $value\n";
}
・keys関数で、%hashというハッシュ、のキーを「リスト」一覧にする。
・そのリストひとつひとつを取り出して、ひとつひとつ変数（$key）にセットする。
・命令はprintしろ。 "キー"と　ハッシュをしらべて変数($key)に該当する、"値"
（ちょっとむずかしい……）
=cut

# ハッシュにキーと値を追加する方法。
$hash{'新渡戸稲造'} = 42;
# $hash{$key} = $value;
# $keyにキーが入っていて、その値を$valueとしたい場合。

=pod
ハッシュへの追加
$hash{$key} = $value;
ハッシュ｛キー｝＝値

復習！配列への追加は
$array[$index] = $value;
配列 [添字]　＝値 
=cut

print "◇追加後\n";
foreach my $key (keys(%hash)) {
    print "$key → $hash{$key}\n";
}
# 北里柴三郎 → 21
# 夏目漱石 → 22
# 渋沢栄一 → 36
# 津田梅子 → 22
# 新渡戸稲造 → 42
# 増えていること確認！最後尾でないことも確認。

# 順番は勝手にやってくれる…こちらの思うように、「表示」させたい。
print "一定の順で表示させる。\n";
foreach (sort keys %hash) {
    print "$_ → $hash{$_}\n";
}
# keys %hash は全てのキーからなるリスト、を作る。
# sortはリストを文字列として比較して並べ替える。
# 北里柴三郎 → 21
# 夏目漱石 → 22
# 新渡戸稲造 → 42
# 津田梅子 → 22
# 渋沢栄一 → 36
# 漢字だとわかりにくいけども。
