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

print "値によって並べ替え。\n";
foreach (sort { $hash{$a} <=> $hash{$b} } keys %hash) {
    print "$_ → $hash{$_}\n";
}
# 北里柴三郎 → 21
# 夏目漱石 → 22
# 津田梅子 → 22
# 渋沢栄一 → 36
# 新渡戸稲造 → 42
# sort {$aと$bを使ったどちらを前に置くかの比較式} リスト
# <=> はスペースシップ演算子というのだそう。

# ハッシュの実例１
my %uniq;
my @array = (3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5);
foreach my $item (@array) {
    $uniq{$item} = 1;
}
my @uniqarray = keys(%uniq);
print "@uniqarray\n";
# 5 9 3 4 6 1 2
=pod
重複するものを一つにまとめ、重複を無くしている！
foreachの中のハッシュ$uniq{$item}に1を代入しているが、0でもhelloでもよい。
ハッシュ%uniq中に$itemをキーとして含めたいがため。
foreachが終わってから、keys(%uniq)としてキーを取り出している。


…噛み砕いて？
%uniq というハッシュを作成します。
このハッシュは、配列の要素をキーとして格納し、重複を排除する役割を果たします。

foreach ループを使って、配列 @array の各要素 $item に対して：
$item をハッシュ %uniq のキーとして追加
重要なのは、ハッシュのキーに $item を使用することで、
同じキーが重複して追加されないことです。
つまり、同じ数字が2回出現しても、ハッシュには一度だけ記録されます。
※別の解説
このループでは、配列 @array の各要素を $item に格納し、
その $item をハッシュ %uniq のキーとして追加しています。
$uniq{$item} = 1; の部分は、$item をキーとしてハッシュに追加しています。
$uniq{$item}は%uniqというハッシュから特定のキー（$item）を使って、値を取り出す/設定する方法。
ここで値として 1 を使っていますが、重要なのは「値は何でも良い」ということです。
ハッシュのキーの存在が大事で、同じキーを再度追加しようとすると、
値は上書きされますが、キーの重複は許されません。
例えば：
最初に $item が 1 のとき、$uniq{1} = 1; となります。
次に $item がまた 1 のとき、$uniq{1} = 1; となりますが、実際には何も変わりません。
こうして、ハッシュ %uniq には重複が排除された値がキーとして残ることになります。
※具体的に？
最初の反復で、$item は 3 になります：
ハッシュは: %uniq = (3 => 1);
…
次の反復で、$item は 4 になります：
ハッシュは: %uniq = (3 => 1, 1 => 1, 4 => 1);
…
次の反復で、$item は再度 1 になります：
ここでは既に 1 がハッシュにあるため、何も変わりません。
↑これで$itemに重複した数字が使われても、%uniqは消えている！
%uniq = (3 => 1, 1 => 1, 4 => 1, 5 => 1 ...)となる。
具体例おわり。

keys(%uniq) を使って、ハッシュ %uniq に格納されている全てのキー
（つまり一意な数字）を取得し、@uniqarray に格納します。
値はどうでもいい。なんでもいい。使わないから。欲しいのはキー。
この時点で、@uniqarray には重複が排除された数字だけが含まれています。

ハッシュの実例１終わり。
=cut

# ハッシュの実例２
my %counter;
my @name = ('Yuki', 'Tomura', 'Sato', 'Sato', 'yuki', 'Mamoru', 'Tomura', 'Tomura');
foreach my $name (@name) {
    $counter{$name}++;
}
foreach my $name (sort keys %counter) {
    print "$name $counter{$name}\n";
}
# Mamoru 1
# Sato 2
# Tomura 3
# Yuki 1
# yuki 1
=pod
最初のforeach：配列@nameの中に現れる要素の数を%counterを使って数えている。
$counter{$name} = $counter{$name} +1; と同じ。変数を1増加させる記述。
2回目のforeach：数えた結果を名前順にソートして表示している。
結果：ハッシュのキーは大文字小文字区別する点に注意。
=cut

# ハッシュの実例３
my %name_to_age = ('Yuki' => 36, 'Sato' => 22, 'Tom' => 21, );
my %age_to_name;
foreach my $name (keys %name_to_age) {
    $age_to_name{$name_to_age{$name}} = $name;
}
foreach my $age (keys %age_to_name) {
    print "$age → $age_to_name{$age}\n";
}
# 22 → Sato
# 36 → Yuki
# 21 → Tom
=pod
ハッシュのキーには重複がない。値にも重複が無いならば入れ替え可能。
$age_to_name{$name_to_age{$name}} = $name;

keys %hash は全てのキーからなるリスト、を作る。
foreach my $name (keys %name_to_age) {の部分は、
%name_to_ageというハッシュのすべてのキーからなるリスト。
この要素を一つずつ$nameに代入。つまり、キー一覧になった！

%hashというハッシュの｛キー｝から値を得るには、$hash{キー}　= 値だった。
各名前についてループを回し、$name_to_age{$name}を使ってその年齢を取得。

$name_to_age{値}　＝$name　とした！（これで逆になったわけだ）

いちおう本における解説は以下
                        　$name　　　　　　　：名前
            {$name_to_age{$name}}         　 :に対応した年齢
$age_to_name{$name_to_age{$name}}            :をキーとしたハッシュの値として
$age_to_name{$name_to_age{$name}} = $name;   :名前を代入する。
以上解説。
=cut
