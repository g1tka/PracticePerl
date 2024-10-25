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
