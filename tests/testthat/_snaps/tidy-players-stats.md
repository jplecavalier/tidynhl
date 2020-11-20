# tidy_players_stats() gives correct data

       player_name season_years season_type team_abbreviation skater_games
    1  Paul Kariya      1994-95     regular               ANA           47
    2  Paul Kariya      1995-96     regular               ANA           82
    3  Paul Kariya      1996-97     regular               ANA           69
    4  Paul Kariya      1996-97    playoffs               ANA           11
    5  Paul Kariya      1997-98     regular               ANA           22
    6  Paul Kariya      1998-99     regular               ANA           82
    7  Paul Kariya      1998-99    playoffs               ANA            3
    8  Paul Kariya      1999-00     regular               ANA           74
    9  Paul Kariya      2000-01     regular               ANA           66
    10 Paul Kariya      2001-02     regular               ANA           82
    11 Paul Kariya      2002-03     regular               ANA           82
    12 Paul Kariya      2002-03    playoffs               ANA           21
    13 Paul Kariya      2003-04     regular               COL           51
    14 Paul Kariya      2003-04    playoffs               COL            1
    15 Paul Kariya      2005-06     regular               NSH           82
    16 Paul Kariya      2005-06    playoffs               NSH            5
    17 Paul Kariya      2006-07     regular               NSH           82
    18 Paul Kariya      2006-07    playoffs               NSH            5
    19 Paul Kariya      2007-08     regular               STL           82
    20 Paul Kariya      2008-09     regular               STL           11
    21 Paul Kariya      2009-10     regular               STL           75
       skater_goals skater_assists skater_points skater_plusminus skater_pim
    1            18             21            39              -17          4
    2            50             58           108                9         20
    3            44             55            99               36          6
    4             7              6            13               -2          4
    5            17             14            31               12         23
    6            39             62           101               17         40
    7             1              3             4                0          0
    8            42             44            86               22         24
    9            33             34            67               -9         20
    10           32             25            57              -15         28
    11           25             56            81               -3         48
    12            6              6            12                0          6
    13           11             25            36               -5         22
    14            0              1             1               -1          0
    15           31             54            85               -6         40
    16            2              5             7                0          0
    17           24             52            76                6         36
    18            0              2             2               -4          2
    19           16             49            65              -10         50
    20            2             13            15                1          2
    21           18             25            43               -7         36
       skater_toi skater_shifts skater_gwg skater_otg skater_shots skater_blocked
    1          NA            NA          3          0          134             NA
    2          NA            NA          9          3          349             NA
    3          NA            NA         10          0          340             NA
    4          NA            NA          1          1           61             NA
    5    519.5000           601          2          0          103              0
    6   2094.3833          2201          4          0          429              0
    7     78.1500            86          0          0           11              0
    8   1802.9000          1951          3          0          324              0
    9   1520.1667          1635          3          0          230              0
    10  1821.7333          2040          8          0          289              0
    11  1663.6333          2213          2          0          257             10
    12   446.1500           641          1          1           53              0
    13   949.5833          1408          1          0          110              0
    14    16.0000            29          0          0            2              0
    15  1564.6500          1919          3          1          245             44
    16   103.9000           123          0          0           12              3
    17  1671.1833          2008          2          0          224             49
    18    98.0000           131          0          0           10              2
    19  1535.6500          1932          1          0          223             21
    20   199.1333           252          0          0           31              6
    21  1286.5000          1790          2          0          221             25
       skater_hits skater_ev_goals skater_ev_assists skater_ev_points skater_ev_toi
    1           NA              10                13               23            NA
    2           NA              27                34               61            NA
    3           NA              26                35               61            NA
    4           NA               3                 3                6            NA
    5           18              14                12               26     373.85000
    6           35              26                29               55    1379.55000
    7            3               1                 1                2      44.95000
    8           23              28                24               52    1269.13333
    9           19              12                18               30    1059.00000
    10          23              21                11               32    1280.35000
    11           8              13                32               45    1260.40000
    12           5               6                 3                9     381.71667
    13          27               5                15               20     681.70000
    14           0               0                 0                0      12.46667
    15          18              17                22               39    1011.91667
    16           1               0                 1                1      71.60000
    17          16              19                32               51    1232.43333
    18           5               0                 0                0      76.30000
    19          18              11                33               44    1182.58333
    20           7               2                 4                6     149.73333
    21          36              15                16               31    1041.68333
       skater_pp_goals skater_pp_assists skater_pp_points skater_pp_toi
    1                7                 8               15            NA
    2               20                21               41            NA
    3               15                19               34            NA
    4                4                 3                7            NA
    5                3                 2                5    107.533333
    6               11                32               43    475.616667
    7                0                 2                2     19.900000
    8               11                20               31    377.666667
    9               18                16               34    369.533333
    10              11                14               25    447.466667
    11              11                24               35    364.683333
    12               0                 3                3     61.716667
    13               5                 9               14    179.483333
    14               0                 1                1      3.116667
    15              14                32               46    501.016667
    16               2                 4                6     32.216667
    17               5                20               25    408.616667
    18               0                 2                2     17.716667
    19               5                16               21    346.333333
    20               0                 9                9     46.600000
    21               3                 9               12    193.850000
       skater_pk_goals skater_pk_assists skater_pk_points skater_pk_toi
    1                1                 0                1            NA
    2                3                 3                6            NA
    3                3                 1                4            NA
    4                0                 0                0            NA
    5                0                 0                0   38.11666667
    6                2                 1                3  239.21666667
    7                0                 0                0   13.30000000
    8                3                 0                3  156.10000000
    9                3                 0                3   91.63333333
    10               0                 0                0   93.91666667
    11               1                 0                1   38.55000000
    12               0                 0                0    2.71666667
    13               1                 1                2   88.40000000
    14               0                 0                0    0.41666667
    15               0                 0                0   51.71666667
    16               0                 0                0    0.08333333
    17               0                 0                0   30.13333333
    18               0                 0                0    3.98333333
    19               0                 0                0    6.73333333
    20               0                 0                0    2.80000000
    21               0                 0                0   50.96666667
       goalie_games goalie_started goalie_wins goalie_losses goalie_ties goalie_ot
    1            NA             NA          NA            NA          NA        NA
    2            NA             NA          NA            NA          NA        NA
    3            NA             NA          NA            NA          NA        NA
    4            NA             NA          NA            NA          NA        NA
    5            NA             NA          NA            NA          NA        NA
    6            NA             NA          NA            NA          NA        NA
    7            NA             NA          NA            NA          NA        NA
    8            NA             NA          NA            NA          NA        NA
    9            NA             NA          NA            NA          NA        NA
    10           NA             NA          NA            NA          NA        NA
    11           NA             NA          NA            NA          NA        NA
    12           NA             NA          NA            NA          NA        NA
    13           NA             NA          NA            NA          NA        NA
    14           NA             NA          NA            NA          NA        NA
    15           NA             NA          NA            NA          NA        NA
    16           NA             NA          NA            NA          NA        NA
    17           NA             NA          NA            NA          NA        NA
    18           NA             NA          NA            NA          NA        NA
    19           NA             NA          NA            NA          NA        NA
    20           NA             NA          NA            NA          NA        NA
    21           NA             NA          NA            NA          NA        NA
       goalie_shutouts goalie_shotagainst goalie_goalagainst goalie_savepct
    1               NA                 NA                 NA             NA
    2               NA                 NA                 NA             NA
    3               NA                 NA                 NA             NA
    4               NA                 NA                 NA             NA
    5               NA                 NA                 NA             NA
    6               NA                 NA                 NA             NA
    7               NA                 NA                 NA             NA
    8               NA                 NA                 NA             NA
    9               NA                 NA                 NA             NA
    10              NA                 NA                 NA             NA
    11              NA                 NA                 NA             NA
    12              NA                 NA                 NA             NA
    13              NA                 NA                 NA             NA
    14              NA                 NA                 NA             NA
    15              NA                 NA                 NA             NA
    16              NA                 NA                 NA             NA
    17              NA                 NA                 NA             NA
    18              NA                 NA                 NA             NA
    19              NA                 NA                 NA             NA
    20              NA                 NA                 NA             NA
    21              NA                 NA                 NA             NA
       goalie_gaa goalie_toi goalie_ev_shotagainst goalie_ev_goalagainst
    1          NA         NA                    NA                    NA
    2          NA         NA                    NA                    NA
    3          NA         NA                    NA                    NA
    4          NA         NA                    NA                    NA
    5          NA         NA                    NA                    NA
    6          NA         NA                    NA                    NA
    7          NA         NA                    NA                    NA
    8          NA         NA                    NA                    NA
    9          NA         NA                    NA                    NA
    10         NA         NA                    NA                    NA
    11         NA         NA                    NA                    NA
    12         NA         NA                    NA                    NA
    13         NA         NA                    NA                    NA
    14         NA         NA                    NA                    NA
    15         NA         NA                    NA                    NA
    16         NA         NA                    NA                    NA
    17         NA         NA                    NA                    NA
    18         NA         NA                    NA                    NA
    19         NA         NA                    NA                    NA
    20         NA         NA                    NA                    NA
    21         NA         NA                    NA                    NA
       goalie_ev_savepct goalie_pp_shotagainst goalie_pp_goalagainst
    1                 NA                    NA                    NA
    2                 NA                    NA                    NA
    3                 NA                    NA                    NA
    4                 NA                    NA                    NA
    5                 NA                    NA                    NA
    6                 NA                    NA                    NA
    7                 NA                    NA                    NA
    8                 NA                    NA                    NA
    9                 NA                    NA                    NA
    10                NA                    NA                    NA
    11                NA                    NA                    NA
    12                NA                    NA                    NA
    13                NA                    NA                    NA
    14                NA                    NA                    NA
    15                NA                    NA                    NA
    16                NA                    NA                    NA
    17                NA                    NA                    NA
    18                NA                    NA                    NA
    19                NA                    NA                    NA
    20                NA                    NA                    NA
    21                NA                    NA                    NA
       goalie_pp_savepct goalie_pk_shotagainst goalie_pk_goalagainst
    1                 NA                    NA                    NA
    2                 NA                    NA                    NA
    3                 NA                    NA                    NA
    4                 NA                    NA                    NA
    5                 NA                    NA                    NA
    6                 NA                    NA                    NA
    7                 NA                    NA                    NA
    8                 NA                    NA                    NA
    9                 NA                    NA                    NA
    10                NA                    NA                    NA
    11                NA                    NA                    NA
    12                NA                    NA                    NA
    13                NA                    NA                    NA
    14                NA                    NA                    NA
    15                NA                    NA                    NA
    16                NA                    NA                    NA
    17                NA                    NA                    NA
    18                NA                    NA                    NA
    19                NA                    NA                    NA
    20                NA                    NA                    NA
    21                NA                    NA                    NA
       goalie_pk_savepct
    1                 NA
    2                 NA
    3                 NA
    4                 NA
    5                 NA
    6                 NA
    7                 NA
    8                 NA
    9                 NA
    10                NA
    11                NA
    12                NA
    13                NA
    14                NA
    15                NA
    16                NA
    17                NA
    18                NA
    19                NA
    20                NA
    21                NA

---

         player_name season_years season_type team_abbreviation skater_games
    1  Curtis Joseph      1989-90     regular               STL           NA
    2  Curtis Joseph      1989-90    playoffs               STL           NA
    3  Curtis Joseph      1989-90    playoffs               STL           NA
    4  Curtis Joseph      1990-91     regular               STL           NA
    5  Curtis Joseph      1991-92     regular               STL           NA
    6  Curtis Joseph      1991-92    playoffs               STL           NA
    7  Curtis Joseph      1992-93     regular               STL           NA
    8  Curtis Joseph      1992-93    playoffs               STL           NA
    9  Curtis Joseph      1993-94     regular               STL           NA
    10 Curtis Joseph      1993-94    playoffs               STL           NA
    11 Curtis Joseph      1994-95     regular               STL           NA
    12 Curtis Joseph      1994-95    playoffs               STL           NA
    13 Curtis Joseph      1995-96     regular               EDM           NA
    14 Curtis Joseph      1996-97     regular               EDM           NA
    15 Curtis Joseph      1996-97    playoffs               EDM           NA
    16 Curtis Joseph      1997-98     regular               EDM           NA
    17 Curtis Joseph      1997-98    playoffs               EDM           NA
    18 Curtis Joseph      1998-99     regular               TOR           NA
    19 Curtis Joseph      1998-99    playoffs               TOR           NA
    20 Curtis Joseph      1999-00     regular               TOR           NA
    21 Curtis Joseph      1999-00    playoffs               TOR           NA
    22 Curtis Joseph      2000-01     regular               TOR           NA
    23 Curtis Joseph      2000-01    playoffs               TOR           NA
    24 Curtis Joseph      2001-02     regular               TOR           NA
    25 Curtis Joseph      2001-02    playoffs               TOR           NA
    26 Curtis Joseph      2002-03     regular               DET           NA
    27 Curtis Joseph      2002-03    playoffs               DET           NA
    28 Curtis Joseph      2003-04     regular               DET           NA
    29 Curtis Joseph      2003-04    playoffs               DET           NA
    30 Curtis Joseph      2005-06     regular               PHX           NA
    31 Curtis Joseph      2006-07     regular               PHX           NA
    32 Curtis Joseph      2007-08     regular               CGY           NA
    33 Curtis Joseph      2007-08    playoffs               CGY           NA
    34 Curtis Joseph      2008-09     regular               TOR           NA
       skater_goals skater_assists skater_points skater_plusminus skater_pim
    1            NA             NA            NA               NA         NA
    2            NA             NA            NA               NA         NA
    3            NA             NA            NA               NA         NA
    4            NA             NA            NA               NA         NA
    5            NA             NA            NA               NA         NA
    6            NA             NA            NA               NA         NA
    7            NA             NA            NA               NA         NA
    8            NA             NA            NA               NA         NA
    9            NA             NA            NA               NA         NA
    10           NA             NA            NA               NA         NA
    11           NA             NA            NA               NA         NA
    12           NA             NA            NA               NA         NA
    13           NA             NA            NA               NA         NA
    14           NA             NA            NA               NA         NA
    15           NA             NA            NA               NA         NA
    16           NA             NA            NA               NA         NA
    17           NA             NA            NA               NA         NA
    18           NA             NA            NA               NA         NA
    19           NA             NA            NA               NA         NA
    20           NA             NA            NA               NA         NA
    21           NA             NA            NA               NA         NA
    22           NA             NA            NA               NA         NA
    23           NA             NA            NA               NA         NA
    24           NA             NA            NA               NA         NA
    25           NA             NA            NA               NA         NA
    26           NA             NA            NA               NA         NA
    27           NA             NA            NA               NA         NA
    28           NA             NA            NA               NA         NA
    29           NA             NA            NA               NA         NA
    30           NA             NA            NA               NA         NA
    31           NA             NA            NA               NA         NA
    32           NA             NA            NA               NA         NA
    33           NA             NA            NA               NA         NA
    34           NA             NA            NA               NA         NA
       skater_toi skater_shifts skater_gwg skater_otg skater_shots skater_blocked
    1          NA            NA         NA         NA           NA             NA
    2          NA            NA         NA         NA           NA             NA
    3          NA            NA         NA         NA           NA             NA
    4          NA            NA         NA         NA           NA             NA
    5          NA            NA         NA         NA           NA             NA
    6          NA            NA         NA         NA           NA             NA
    7          NA            NA         NA         NA           NA             NA
    8          NA            NA         NA         NA           NA             NA
    9          NA            NA         NA         NA           NA             NA
    10         NA            NA         NA         NA           NA             NA
    11         NA            NA         NA         NA           NA             NA
    12         NA            NA         NA         NA           NA             NA
    13         NA            NA         NA         NA           NA             NA
    14         NA            NA         NA         NA           NA             NA
    15         NA            NA         NA         NA           NA             NA
    16         NA            NA         NA         NA           NA             NA
    17         NA            NA         NA         NA           NA             NA
    18         NA            NA         NA         NA           NA             NA
    19         NA            NA         NA         NA           NA             NA
    20         NA            NA         NA         NA           NA             NA
    21         NA            NA         NA         NA           NA             NA
    22         NA            NA         NA         NA           NA             NA
    23         NA            NA         NA         NA           NA             NA
    24         NA            NA         NA         NA           NA             NA
    25         NA            NA         NA         NA           NA             NA
    26         NA            NA         NA         NA           NA             NA
    27         NA            NA         NA         NA           NA             NA
    28         NA            NA         NA         NA           NA             NA
    29         NA            NA         NA         NA           NA             NA
    30         NA            NA         NA         NA           NA             NA
    31         NA            NA         NA         NA           NA             NA
    32         NA            NA         NA         NA           NA             NA
    33         NA            NA         NA         NA           NA             NA
    34         NA            NA         NA         NA           NA             NA
       skater_hits skater_ev_goals skater_ev_assists skater_ev_points skater_ev_toi
    1           NA              NA                NA               NA            NA
    2           NA              NA                NA               NA            NA
    3           NA              NA                NA               NA            NA
    4           NA              NA                NA               NA            NA
    5           NA              NA                NA               NA            NA
    6           NA              NA                NA               NA            NA
    7           NA              NA                NA               NA            NA
    8           NA              NA                NA               NA            NA
    9           NA              NA                NA               NA            NA
    10          NA              NA                NA               NA            NA
    11          NA              NA                NA               NA            NA
    12          NA              NA                NA               NA            NA
    13          NA              NA                NA               NA            NA
    14          NA              NA                NA               NA            NA
    15          NA              NA                NA               NA            NA
    16          NA              NA                NA               NA            NA
    17          NA              NA                NA               NA            NA
    18          NA              NA                NA               NA            NA
    19          NA              NA                NA               NA            NA
    20          NA              NA                NA               NA            NA
    21          NA              NA                NA               NA            NA
    22          NA              NA                NA               NA            NA
    23          NA              NA                NA               NA            NA
    24          NA              NA                NA               NA            NA
    25          NA              NA                NA               NA            NA
    26          NA              NA                NA               NA            NA
    27          NA              NA                NA               NA            NA
    28          NA              NA                NA               NA            NA
    29          NA              NA                NA               NA            NA
    30          NA              NA                NA               NA            NA
    31          NA              NA                NA               NA            NA
    32          NA              NA                NA               NA            NA
    33          NA              NA                NA               NA            NA
    34          NA              NA                NA               NA            NA
       skater_pp_goals skater_pp_assists skater_pp_points skater_pp_toi
    1               NA                NA               NA            NA
    2               NA                NA               NA            NA
    3               NA                NA               NA            NA
    4               NA                NA               NA            NA
    5               NA                NA               NA            NA
    6               NA                NA               NA            NA
    7               NA                NA               NA            NA
    8               NA                NA               NA            NA
    9               NA                NA               NA            NA
    10              NA                NA               NA            NA
    11              NA                NA               NA            NA
    12              NA                NA               NA            NA
    13              NA                NA               NA            NA
    14              NA                NA               NA            NA
    15              NA                NA               NA            NA
    16              NA                NA               NA            NA
    17              NA                NA               NA            NA
    18              NA                NA               NA            NA
    19              NA                NA               NA            NA
    20              NA                NA               NA            NA
    21              NA                NA               NA            NA
    22              NA                NA               NA            NA
    23              NA                NA               NA            NA
    24              NA                NA               NA            NA
    25              NA                NA               NA            NA
    26              NA                NA               NA            NA
    27              NA                NA               NA            NA
    28              NA                NA               NA            NA
    29              NA                NA               NA            NA
    30              NA                NA               NA            NA
    31              NA                NA               NA            NA
    32              NA                NA               NA            NA
    33              NA                NA               NA            NA
    34              NA                NA               NA            NA
       skater_pk_goals skater_pk_assists skater_pk_points skater_pk_toi
    1               NA                NA               NA            NA
    2               NA                NA               NA            NA
    3               NA                NA               NA            NA
    4               NA                NA               NA            NA
    5               NA                NA               NA            NA
    6               NA                NA               NA            NA
    7               NA                NA               NA            NA
    8               NA                NA               NA            NA
    9               NA                NA               NA            NA
    10              NA                NA               NA            NA
    11              NA                NA               NA            NA
    12              NA                NA               NA            NA
    13              NA                NA               NA            NA
    14              NA                NA               NA            NA
    15              NA                NA               NA            NA
    16              NA                NA               NA            NA
    17              NA                NA               NA            NA
    18              NA                NA               NA            NA
    19              NA                NA               NA            NA
    20              NA                NA               NA            NA
    21              NA                NA               NA            NA
    22              NA                NA               NA            NA
    23              NA                NA               NA            NA
    24              NA                NA               NA            NA
    25              NA                NA               NA            NA
    26              NA                NA               NA            NA
    27              NA                NA               NA            NA
    28              NA                NA               NA            NA
    29              NA                NA               NA            NA
    30              NA                NA               NA            NA
    31              NA                NA               NA            NA
    32              NA                NA               NA            NA
    33              NA                NA               NA            NA
    34              NA                NA               NA            NA
       goalie_games goalie_started goalie_wins goalie_losses goalie_ties goalie_ot
    1            15             14           9             5           1        NA
    2             6              5           4             1          NA        NA
    3             6             NA           4             1          NA         0
    4            30             29          16            10           2        NA
    5            60             58          27            20          10        NA
    6             6              6           2             4          NA        NA
    7            68             67          29            28           9        NA
    8            11             11           7             4          NA        NA
    9            71             71          36            23          11        NA
    10            4              4           0             4          NA        NA
    11           36             36          20            10           1        NA
    12            7              7           3             3          NA        NA
    13           34             34          15            16           2        NA
    14           72             72          32            29           9        NA
    15           12             12           5             7          NA        NA
    16           71             71          29            31           9        NA
    17           12             12           5             7          NA        NA
    18           67             67          35            24           7        NA
    19           17             17           9             8          NA        NA
    20           63             63          36            20           7        NA
    21           12             12           6             6          NA        NA
    22           68             68          33            27           8        NA
    23           11             11           7             4          NA        NA
    24           51             51          29            17           5        NA
    25           20             20          10            10          NA        NA
    26           61             60          34            19           6        NA
    27            4              4           0             4          NA        NA
    28           31             30          16            10           3        NA
    29            9              8           4             4          NA        NA
    30           60             59          32            21          NA         3
    31           55             50          18            31          NA         2
    32            9              5           3             2          NA         0
    33            2              0           1             0          NA        NA
    34           21             11           5             9          NA         1
       goalie_shutouts goalie_shotagainst goalie_goalagainst goalie_savepct
    1                0                435                 48      0.8896552
    2                0                166                 18      0.8915663
    3                0                167                 18      0.8922156
    4                0                874                 89      0.8981693
    5                2               1953                175      0.9103943
    6                0                217                 23      0.8940092
    7                1               2202                196      0.9109900
    8                2                438                 27      0.9383562
    9                1               2382                213      0.9105793
    10               0                158                 15      0.9050633
    11               1                904                 89      0.9015487
    12               0                178                 24      0.8651685
    13               0                971                111      0.8856849
    14               6               2144                200      0.9067164
    15               2                405                 36      0.9111111
    16               8               1901                181      0.9047870
    17               3                319                 23      0.9278997
    18               3               1903                171      0.9101419
    19               1                440                 41      0.9068182
    20               4               1854                158      0.9147789
    21               1                369                 25      0.9322493
    22               6               1907                163      0.9145254
    23               3                329                 24      0.9270517
    24               4               1210                114      0.9057851
    25               3                557                 48      0.9138241
    26               5               1676                148      0.9116945
    27               0                120                 10      0.9166667
    28               2                744                 68      0.9086022
    29               1                197                 12      0.9390863
    30               4               1690                166      0.9017751
    31               4               1481                159      0.8926401
    32               0                181                 17      0.9060773
    33               0                 33                  1      0.9696970
    34               0                383                 50      0.8694517
       goalie_gaa goalie_toi goalie_ev_shotagainst goalie_ev_goalagainst
    1   3.3815385  851.68333                    35                    35
    2   3.3046050  326.81667                    11                    11
    3   3.3027523  327.00000                    NA                    NA
    4   3.1220767 1710.40000                    63                    63
    5   3.0055531 3493.53333                   126                   126
    6   3.6381212  379.31667                    13                    13
    7   3.0230067 3890.16667                   142                   142
    8   2.2670554  714.58333                    18                    18
    9   3.0969430 4126.65000                   150                   150
    10  3.6637492  245.65000                     9                     9
    11  2.7902602 1913.80000                    57                    57
    12  3.6755009  391.78333                     8                     8
    13  3.4407047 1935.65000                    74                    74
    14  2.9265794 4100.35000                   137                   137
    15  2.8148824  767.35000                    25                    25
    16  2.6280552 4132.33333                  1430                   118
    17  1.9277333  715.86667                   224                    15
    18  2.5642735 4001.13333                  1458                   118
    19  2.4341172 1010.63333                   317                    26
    20  2.4940258 3801.08333                  1424                   108
    21  2.0576132  729.00000                   287                    17
    22  2.3853271 4100.06667                  1446                   111
    23  2.1023944  684.93333                   248                    18
    24  2.2317083 3064.91667                   947                    80
    25  2.2980863 1253.21667                   420                    27
    26  2.4898709 3566.45000                  1264                   102
    27  2.0787620  288.63333                    87                    10
    28  2.3888054 1707.96667                   550                    48
    29  1.3911251  517.56667                   168                    10
    30  2.9087086 3424.20000                  1143                   100
    31  3.1871179 2993.30000                  1093                   102
    32  2.5521268  399.66667                   140                    11
    33  0.7559849   79.36667                    27                     1
    34  3.5684549  840.70000                   316                    34
       goalie_ev_savepct goalie_pp_shotagainst goalie_pp_goalagainst
    1          0.0000000                    10                    10
    2          0.0000000                     5                     5
    3                 NA                    NA                    NA
    4          0.0000000                    20                    20
    5          0.0000000                    40                    40
    6          0.0000000                     9                     9
    7          0.0000000                    48                    48
    8          0.0000000                     9                     9
    9          0.0000000                    53                    53
    10         0.0000000                     6                     6
    11         0.0000000                    30                    30
    12         0.0000000                    10                    10
    13         0.0000000                    33                    33
    14         0.0000000                    52                    52
    15         0.0000000                    10                    10
    16         0.9174825                   446                    55
    17         0.9330357                    77                     7
    18         0.9190672                   371                    48
    19         0.9179811                   102                    13
    20         0.9241573                   357                    46
    21         0.9407666                    68                     7
    22         0.9232365                   391                    44
    23         0.9274194                    70                     6
    24         0.9155227                   230                    31
    25         0.9357143                   119                    20
    26         0.9193038                   364                    43
    27         0.8850575                    27                     0
    28         0.9127273                   167                    18
    29         0.9404762                    24                     2
    30         0.9125109                   450                    60
    31         0.9066789                   330                    48
    32         0.9214286                    34                     6
    33         0.9629630                     6                     0
    34         0.8924051                    59                    16
       goalie_pp_savepct goalie_pk_shotagainst goalie_pk_goalagainst
    1          0.0000000                     3                     3
    2          0.0000000                     2                     2
    3                 NA                    NA                    NA
    4          0.0000000                     6                     6
    5          0.0000000                     9                     9
    6          0.0000000                     1                     1
    7          0.0000000                     6                     6
    8          0.0000000                     0                     0
    9          0.0000000                    10                    10
    10         0.0000000                     0                     0
    11         0.0000000                     2                     2
    12         0.0000000                     6                     6
    13         0.0000000                     4                     4
    14         0.0000000                    10                    10
    15         0.0000000                     1                     1
    16         0.8766816                    67                     8
    17         0.9090909                    18                     1
    18         0.8706199                    73                     4
    19         0.8725490                    21                     2
    20         0.8711485                    73                     4
    21         0.8970588                    14                     1
    22         0.8874680                    70                     8
    23         0.9142857                    11                     0
    24         0.8652174                    33                     2
    25         0.8319328                    18                     0
    26         0.8818681                    48                     3
    27         1.0000000                     6                     0
    28         0.8922156                    27                     2
    29         0.9166667                     5                     0
    30         0.8666667                    97                     5
    31         0.8545455                    58                     7
    32         0.8235294                     7                     0
    33         1.0000000                     0                     0
    34         0.7288136                     8                     0
       goalie_pk_savepct
    1          0.0000000
    2          0.0000000
    3                 NA
    4          0.0000000
    5          0.0000000
    6          0.0000000
    7          0.0000000
    8                NaN
    9          0.0000000
    10               NaN
    11         0.0000000
    12         0.0000000
    13         0.0000000
    14         0.0000000
    15         0.0000000
    16         0.8805970
    17         0.9444444
    18         0.9452055
    19         0.9047619
    20         0.9452055
    21         0.9285714
    22         0.8857143
    23         1.0000000
    24         0.9393939
    25         1.0000000
    26         0.9375000
    27         1.0000000
    28         0.9259259
    29         1.0000000
    30         0.9484536
    31         0.8793103
    32         1.0000000
    33               NaN
    34         1.0000000

---

         player_name season_years season_type team_abbreviation skater_games
    1  Scott Stevens      1982-83     regular               WSH           77
    2  Scott Stevens      1982-83    playoffs               WSH            4
    3  Scott Stevens      1983-84     regular               WSH           78
    4  Scott Stevens      1983-84    playoffs               WSH            8
    5  Scott Stevens      1984-85     regular               WSH           80
    6  Scott Stevens      1984-85    playoffs               WSH            5
    7  Scott Stevens      1985-86     regular               WSH           73
    8  Scott Stevens      1985-86    playoffs               WSH            9
    9  Scott Stevens      1986-87     regular               WSH           77
    10 Scott Stevens      1986-87    playoffs               WSH            7
    11 Scott Stevens      1987-88     regular               WSH           80
    12 Scott Stevens      1987-88    playoffs               WSH           13
    13 Scott Stevens      1988-89     regular               WSH           80
    14 Scott Stevens      1988-89    playoffs               WSH            6
    15 Scott Stevens      1989-90     regular               WSH           56
    16 Scott Stevens      1989-90    playoffs               WSH           15
    17 Scott Stevens      1990-91     regular               STL           78
    18 Scott Stevens      1990-91    playoffs               STL           13
    19 Scott Stevens      1991-92     regular               NJD           68
    20 Scott Stevens      1991-92    playoffs               NJD            7
    21 Scott Stevens      1992-93     regular               NJD           81
    22 Scott Stevens      1992-93    playoffs               NJD            5
    23 Scott Stevens      1993-94     regular               NJD           83
    24 Scott Stevens      1993-94    playoffs               NJD           20
    25 Scott Stevens      1994-95     regular               NJD           48
    26 Scott Stevens      1994-95    playoffs               NJD           20
    27 Scott Stevens      1995-96     regular               NJD           82
    28 Scott Stevens      1996-97     regular               NJD           79
    29 Scott Stevens      1996-97    playoffs               NJD           10
    30 Scott Stevens      1997-98     regular               NJD           80
    31 Scott Stevens      1997-98    playoffs               NJD            6
    32 Scott Stevens      1998-99     regular               NJD           75
    33 Scott Stevens      1998-99    playoffs               NJD            7
    34 Scott Stevens      1999-00     regular               NJD           78
    35 Scott Stevens      1999-00    playoffs               NJD           23
    36 Scott Stevens      2000-01     regular               NJD           81
    37 Scott Stevens      2000-01    playoffs               NJD           25
    38 Scott Stevens      2001-02     regular               NJD           82
    39 Scott Stevens      2001-02    playoffs               NJD            6
    40 Scott Stevens      2002-03     regular               NJD           81
    41 Scott Stevens      2002-03    playoffs               NJD           24
    42 Scott Stevens      2003-04     regular               NJD           38
    43   Paul Kariya      1994-95     regular               ANA           47
    44   Paul Kariya      1995-96     regular               ANA           82
    45   Paul Kariya      1996-97     regular               ANA           69
    46   Paul Kariya      1996-97    playoffs               ANA           11
    47   Paul Kariya      1997-98     regular               ANA           22
    48   Paul Kariya      1998-99     regular               ANA           82
    49   Paul Kariya      1998-99    playoffs               ANA            3
    50   Paul Kariya      1999-00     regular               ANA           74
    51   Paul Kariya      2000-01     regular               ANA           66
    52   Paul Kariya      2001-02     regular               ANA           82
    53   Paul Kariya      2002-03     regular               ANA           82
    54   Paul Kariya      2002-03    playoffs               ANA           21
    55   Paul Kariya      2003-04     regular               COL           51
    56   Paul Kariya      2003-04    playoffs               COL            1
    57   Paul Kariya      2005-06     regular               NSH           82
    58   Paul Kariya      2005-06    playoffs               NSH            5
    59   Paul Kariya      2006-07     regular               NSH           82
    60   Paul Kariya      2006-07    playoffs               NSH            5
    61   Paul Kariya      2007-08     regular               STL           82
    62   Paul Kariya      2008-09     regular               STL           11
    63   Paul Kariya      2009-10     regular               STL           75
       skater_goals skater_assists skater_points skater_plusminus skater_pim
    1             9             16            25               15        195
    2             1              0             1               -2         26
    3            13             32            45               25        201
    4             1              8             9                1         21
    5            21             44            65               19        221
    6             0              1             1               -4         20
    7            15             38            53                0        165
    8             3              8            11                8         12
    9            10             51            61               15        283
    10            0              5             5                4         19
    11           12             60            72               14        184
    12            1             11            12               -1         46
    13            7             61            68                1        225
    14            1              4             5               -2         11
    15           11             29            40                1        154
    16            2              7             9               -1         25
    17            5             44            49               23        150
    18            0              3             3                8         36
    19           17             42            59               24        124
    20            2              1             3               -5         29
    21           12             45            57               14        120
    22            2              2             4               -2         10
    23           18             60            78               53        112
    24            2              9            11               -1         42
    25            2             20            22                4         56
    26            1              7             8               10         24
    27            5             23            28                7        100
    28            5             19            24               26         70
    29            0              4             4               -2          2
    30            4             22            26               19         80
    31            1              0             1                4          8
    32            5             22            27               29         64
    33            2              1             3               -2         10
    34            8             21            29               30        103
    35            3              8            11                9          6
    36            9             22            31               40         71
    37            1              7             8                3         37
    38            1             16            17               15         44
    39            0              0             0                5          4
    40            4             16            20               18         41
    41            3              6             9               14         14
    42            3              9            12                3         22
    43           18             21            39              -17          4
    44           50             58           108                9         20
    45           44             55            99               36          6
    46            7              6            13               -2          4
    47           17             14            31               12         23
    48           39             62           101               17         40
    49            1              3             4                0          0
    50           42             44            86               22         24
    51           33             34            67               -9         20
    52           32             25            57              -15         28
    53           25             56            81               -3         48
    54            6              6            12                0          6
    55           11             25            36               -5         22
    56            0              1             1               -1          0
    57           31             54            85               -6         40
    58            2              5             7                0          0
    59           24             52            76                6         36
    60            0              2             2               -4          2
    61           16             49            65              -10         50
    62            2             13            15                1          2
    63           18             25            43               -7         36
       skater_toi skater_shifts skater_gwg skater_otg skater_shots skater_blocked
    1          NA            NA          0          0          121             NA
    2          NA            NA          0          0            8             NA
    3          NA            NA          2          0          155             NA
    4          NA            NA          0          0           21             NA
    5          NA            NA          5          0          170             NA
    6          NA            NA          0          0           11             NA
    7          NA            NA          2          1          121             NA
    8          NA            NA          2          0           17             NA
    9          NA            NA          0          0          163             NA
    10         NA            NA          0          0           19             NA
    11         NA            NA          2          0          231             NA
    12         NA            NA          0          0           42             NA
    13         NA            NA          3          0          195             NA
    14         NA            NA          0          0           16             NA
    15         NA            NA          0          0          143             NA
    16         NA            NA          0          0           35             NA
    17         NA            NA          1          0          160             NA
    18         NA            NA          0          0           17             NA
    19         NA            NA          2          0          156             NA
    20         NA            NA          1          0            9             NA
    21         NA            NA          1          0          146             NA
    22         NA            NA          0          0           21             NA
    23         NA            NA          4          0          215             NA
    24         NA            NA          1          0           56             NA
    25         NA            NA          1          0          111             NA
    26         NA            NA          1          0           54             NA
    27         NA            NA          1          0          174             NA
    28         NA            NA          1          0          166             NA
    29         NA            NA          0          0           27             NA
    30  1917.7167          1946          1          1           94              0
    31   150.8500           168          0          0           11              0
    32  1813.2000          1808          1          0          111              0
    33   171.2667           174          0          0           14              0
    34  1823.5167          1719          1          0          133              0
    35   584.7333           648          2          0           29              0
    36  1993.8333          2010          2          0          171              0
    37   565.3000           659          0          0           34              0
    38  1911.5000          2154          1          0          121              0
    39   133.4167           161          0          0            7              0
    40  1869.7167          2227          2          1          113             62
    41   593.6333           747          1          0           33              0
    42   912.9167          1061          1          0           68              0
    43         NA            NA          3          0          134             NA
    44         NA            NA          9          3          349             NA
    45         NA            NA         10          0          340             NA
    46         NA            NA          1          1           61             NA
    47   519.5000           601          2          0          103              0
    48  2094.3833          2201          4          0          429              0
    49    78.1500            86          0          0           11              0
    50  1802.9000          1951          3          0          324              0
    51  1520.1667          1635          3          0          230              0
    52  1821.7333          2040          8          0          289              0
    53  1663.6333          2213          2          0          257             10
    54   446.1500           641          1          1           53              0
    55   949.5833          1408          1          0          110              0
    56    16.0000            29          0          0            2              0
    57  1564.6500          1919          3          1          245             44
    58   103.9000           123          0          0           12              3
    59  1671.1833          2008          2          0          224             49
    60    98.0000           131          0          0           10              2
    61  1535.6500          1932          1          0          223             21
    62   199.1333           252          0          0           31              6
    63  1286.5000          1790          2          0          221             25
       skater_hits skater_ev_goals skater_ev_assists skater_ev_points skater_ev_toi
    1           NA               9                15               24            NA
    2           NA               1                 0                1            NA
    3           NA               6                19               25            NA
    4           NA               0                 5                5            NA
    5           NA               5                28               33            NA
    6           NA               0                 0                0            NA
    7           NA              12                27               39            NA
    8           NA               1                 5                6            NA
    9           NA               8                31               39            NA
    10          NA               0                 4                4            NA
    11          NA               6                29               35            NA
    12          NA               1                 4                5            NA
    13          NA               1                28               29            NA
    14          NA               1                 0                1            NA
    15          NA               4                16               20            NA
    16          NA               1                 3                4            NA
    17          NA               4                25               29            NA
    18          NA               0                 3                3            NA
    19          NA               9                27               36            NA
    20          NA               0                 1                1            NA
    21          NA               4                32               36            NA
    22          NA               1                 1                2            NA
    23          NA              12                38               50            NA
    24          NA               0                 5                5            NA
    25          NA               1                15               16            NA
    26          NA               1                 4                5            NA
    27          NA               2                15               17            NA
    28          NA               5                13               18            NA
    29          NA               0                 4                4            NA
    30         132               3                20               23    1521.71667
    31          20               1                 0                1     118.45000
    32         187               5                19               24    1380.03333
    33          15               0                 1                1     140.93333
    34         169               7                18               25    1449.38333
    35          80               3                 6                9     482.65000
    36         175               6                14               20    1412.93333
    37          75               1                 5                6     402.50000
    38         184               1                14               15    1557.88333
    39          20               0                 0                0     103.20000
    40          42               4                13               17    1547.98333
    41          56               2                 6                8     492.06667
    42          42               2                 8               10     706.56667
    43          NA              10                13               23            NA
    44          NA              27                34               61            NA
    45          NA              26                35               61            NA
    46          NA               3                 3                6            NA
    47          18              14                12               26     373.85000
    48          35              26                29               55    1379.55000
    49           3               1                 1                2      44.95000
    50          23              28                24               52    1269.13333
    51          19              12                18               30    1059.00000
    52          23              21                11               32    1280.35000
    53           8              13                32               45    1260.40000
    54           5               6                 3                9     381.71667
    55          27               5                15               20     681.70000
    56           0               0                 0                0      12.46667
    57          18              17                22               39    1011.91667
    58           1               0                 1                1      71.60000
    59          16              19                32               51    1232.43333
    60           5               0                 0                0      76.30000
    61          18              11                33               44    1182.58333
    62           7               2                 4                6     149.73333
    63          36              15                16               31    1041.68333
       skater_pp_goals skater_pp_assists skater_pp_points skater_pp_toi
    1                0                 1                1            NA
    2                0                 0                0            NA
    3                7                13               20            NA
    4                1                 3                4            NA
    5               16                16               32            NA
    6                0                 1                1            NA
    7                3                10               13            NA
    8                2                 3                5            NA
    9                2                19               21            NA
    10               0                 1                1            NA
    11               5                31               36            NA
    12               0                 6                6            NA
    13               6                33               39            NA
    14               0                 4                4            NA
    15               7                13               20            NA
    16               1                 4                5            NA
    17               1                18               19            NA
    18               0                 0                0            NA
    19               7                12               19            NA
    20               2                 0                2            NA
    21               8                13               21            NA
    22               1                 0                1            NA
    23               5                21               26            NA
    24               2                 4                6            NA
    25               1                 5                6            NA
    26               0                 3                3            NA
    27               2                 8               10            NA
    28               0                 6                6            NA
    29               0                 0                0            NA
    30               1                 1                2     29.183333
    31               0                 0                0      2.616667
    32               0                 0                0     35.433333
    33               2                 0                2      2.316667
    34               0                 1                1     52.983333
    35               0                 1                1     11.466667
    36               3                 7               10    221.283333
    37               0                 1                1     61.016667
    38               0                 1                1     66.116667
    39               0                 0                0     10.850000
    40               0                 1                1     73.400000
    41               1                 0                1     32.300000
    42               1                 0                1     85.150000
    43               7                 8               15            NA
    44              20                21               41            NA
    45              15                19               34            NA
    46               4                 3                7            NA
    47               3                 2                5    107.533333
    48              11                32               43    475.616667
    49               0                 2                2     19.900000
    50              11                20               31    377.666667
    51              18                16               34    369.533333
    52              11                14               25    447.466667
    53              11                24               35    364.683333
    54               0                 3                3     61.716667
    55               5                 9               14    179.483333
    56               0                 1                1      3.116667
    57              14                32               46    501.016667
    58               2                 4                6     32.216667
    59               5                20               25    408.616667
    60               0                 2                2     17.716667
    61               5                16               21    346.333333
    62               0                 9                9     46.600000
    63               3                 9               12    193.850000
       skater_pk_goals skater_pk_assists skater_pk_points skater_pk_toi
    1                0                 0                0            NA
    2                0                 0                0            NA
    3                0                 0                0            NA
    4                0                 0                0            NA
    5                0                 0                0            NA
    6                0                 0                0            NA
    7                0                 1                1            NA
    8                0                 0                0            NA
    9                0                 1                1            NA
    10               0                 0                0            NA
    11               1                 0                1            NA
    12               0                 1                1            NA
    13               0                 0                0            NA
    14               0                 0                0            NA
    15               0                 0                0            NA
    16               0                 0                0            NA
    17               0                 1                1            NA
    18               0                 0                0            NA
    19               1                 3                4            NA
    20               0                 0                0            NA
    21               0                 0                0            NA
    22               0                 1                1            NA
    23               1                 1                2            NA
    24               0                 0                0            NA
    25               0                 0                0            NA
    26               0                 0                0            NA
    27               1                 0                1            NA
    28               0                 0                0            NA
    29               0                 0                0            NA
    30               0                 1                1  366.81666667
    31               0                 0                0   29.78333333
    32               0                 3                3  397.73333333
    33               0                 0                0   28.01666667
    34               1                 2                3  321.15000000
    35               0                 1                1   90.61666667
    36               0                 1                1  359.61666667
    37               0                 1                1  101.78333333
    38               0                 1                1  287.50000000
    39               0                 0                0   19.36666667
    40               0                 2                2  248.33333333
    41               0                 0                0   69.26666667
    42               0                 1                1  121.20000000
    43               1                 0                1            NA
    44               3                 3                6            NA
    45               3                 1                4            NA
    46               0                 0                0            NA
    47               0                 0                0   38.11666667
    48               2                 1                3  239.21666667
    49               0                 0                0   13.30000000
    50               3                 0                3  156.10000000
    51               3                 0                3   91.63333333
    52               0                 0                0   93.91666667
    53               1                 0                1   38.55000000
    54               0                 0                0    2.71666667
    55               1                 1                2   88.40000000
    56               0                 0                0    0.41666667
    57               0                 0                0   51.71666667
    58               0                 0                0    0.08333333
    59               0                 0                0   30.13333333
    60               0                 0                0    3.98333333
    61               0                 0                0    6.73333333
    62               0                 0                0    2.80000000
    63               0                 0                0   50.96666667
       goalie_games goalie_started goalie_wins goalie_losses goalie_ties goalie_ot
    1            NA             NA          NA            NA          NA        NA
    2            NA             NA          NA            NA          NA        NA
    3            NA             NA          NA            NA          NA        NA
    4            NA             NA          NA            NA          NA        NA
    5            NA             NA          NA            NA          NA        NA
    6            NA             NA          NA            NA          NA        NA
    7            NA             NA          NA            NA          NA        NA
    8            NA             NA          NA            NA          NA        NA
    9            NA             NA          NA            NA          NA        NA
    10           NA             NA          NA            NA          NA        NA
    11           NA             NA          NA            NA          NA        NA
    12           NA             NA          NA            NA          NA        NA
    13           NA             NA          NA            NA          NA        NA
    14           NA             NA          NA            NA          NA        NA
    15           NA             NA          NA            NA          NA        NA
    16           NA             NA          NA            NA          NA        NA
    17           NA             NA          NA            NA          NA        NA
    18           NA             NA          NA            NA          NA        NA
    19           NA             NA          NA            NA          NA        NA
    20           NA             NA          NA            NA          NA        NA
    21           NA             NA          NA            NA          NA        NA
    22           NA             NA          NA            NA          NA        NA
    23           NA             NA          NA            NA          NA        NA
    24           NA             NA          NA            NA          NA        NA
    25           NA             NA          NA            NA          NA        NA
    26           NA             NA          NA            NA          NA        NA
    27           NA             NA          NA            NA          NA        NA
    28           NA             NA          NA            NA          NA        NA
    29           NA             NA          NA            NA          NA        NA
    30           NA             NA          NA            NA          NA        NA
    31           NA             NA          NA            NA          NA        NA
    32           NA             NA          NA            NA          NA        NA
    33           NA             NA          NA            NA          NA        NA
    34           NA             NA          NA            NA          NA        NA
    35           NA             NA          NA            NA          NA        NA
    36           NA             NA          NA            NA          NA        NA
    37           NA             NA          NA            NA          NA        NA
    38           NA             NA          NA            NA          NA        NA
    39           NA             NA          NA            NA          NA        NA
    40           NA             NA          NA            NA          NA        NA
    41           NA             NA          NA            NA          NA        NA
    42           NA             NA          NA            NA          NA        NA
    43           NA             NA          NA            NA          NA        NA
    44           NA             NA          NA            NA          NA        NA
    45           NA             NA          NA            NA          NA        NA
    46           NA             NA          NA            NA          NA        NA
    47           NA             NA          NA            NA          NA        NA
    48           NA             NA          NA            NA          NA        NA
    49           NA             NA          NA            NA          NA        NA
    50           NA             NA          NA            NA          NA        NA
    51           NA             NA          NA            NA          NA        NA
    52           NA             NA          NA            NA          NA        NA
    53           NA             NA          NA            NA          NA        NA
    54           NA             NA          NA            NA          NA        NA
    55           NA             NA          NA            NA          NA        NA
    56           NA             NA          NA            NA          NA        NA
    57           NA             NA          NA            NA          NA        NA
    58           NA             NA          NA            NA          NA        NA
    59           NA             NA          NA            NA          NA        NA
    60           NA             NA          NA            NA          NA        NA
    61           NA             NA          NA            NA          NA        NA
    62           NA             NA          NA            NA          NA        NA
    63           NA             NA          NA            NA          NA        NA
       goalie_shutouts goalie_shotagainst goalie_goalagainst goalie_savepct
    1               NA                 NA                 NA             NA
    2               NA                 NA                 NA             NA
    3               NA                 NA                 NA             NA
    4               NA                 NA                 NA             NA
    5               NA                 NA                 NA             NA
    6               NA                 NA                 NA             NA
    7               NA                 NA                 NA             NA
    8               NA                 NA                 NA             NA
    9               NA                 NA                 NA             NA
    10              NA                 NA                 NA             NA
    11              NA                 NA                 NA             NA
    12              NA                 NA                 NA             NA
    13              NA                 NA                 NA             NA
    14              NA                 NA                 NA             NA
    15              NA                 NA                 NA             NA
    16              NA                 NA                 NA             NA
    17              NA                 NA                 NA             NA
    18              NA                 NA                 NA             NA
    19              NA                 NA                 NA             NA
    20              NA                 NA                 NA             NA
    21              NA                 NA                 NA             NA
    22              NA                 NA                 NA             NA
    23              NA                 NA                 NA             NA
    24              NA                 NA                 NA             NA
    25              NA                 NA                 NA             NA
    26              NA                 NA                 NA             NA
    27              NA                 NA                 NA             NA
    28              NA                 NA                 NA             NA
    29              NA                 NA                 NA             NA
    30              NA                 NA                 NA             NA
    31              NA                 NA                 NA             NA
    32              NA                 NA                 NA             NA
    33              NA                 NA                 NA             NA
    34              NA                 NA                 NA             NA
    35              NA                 NA                 NA             NA
    36              NA                 NA                 NA             NA
    37              NA                 NA                 NA             NA
    38              NA                 NA                 NA             NA
    39              NA                 NA                 NA             NA
    40              NA                 NA                 NA             NA
    41              NA                 NA                 NA             NA
    42              NA                 NA                 NA             NA
    43              NA                 NA                 NA             NA
    44              NA                 NA                 NA             NA
    45              NA                 NA                 NA             NA
    46              NA                 NA                 NA             NA
    47              NA                 NA                 NA             NA
    48              NA                 NA                 NA             NA
    49              NA                 NA                 NA             NA
    50              NA                 NA                 NA             NA
    51              NA                 NA                 NA             NA
    52              NA                 NA                 NA             NA
    53              NA                 NA                 NA             NA
    54              NA                 NA                 NA             NA
    55              NA                 NA                 NA             NA
    56              NA                 NA                 NA             NA
    57              NA                 NA                 NA             NA
    58              NA                 NA                 NA             NA
    59              NA                 NA                 NA             NA
    60              NA                 NA                 NA             NA
    61              NA                 NA                 NA             NA
    62              NA                 NA                 NA             NA
    63              NA                 NA                 NA             NA
       goalie_gaa goalie_toi goalie_ev_shotagainst goalie_ev_goalagainst
    1          NA         NA                    NA                    NA
    2          NA         NA                    NA                    NA
    3          NA         NA                    NA                    NA
    4          NA         NA                    NA                    NA
    5          NA         NA                    NA                    NA
    6          NA         NA                    NA                    NA
    7          NA         NA                    NA                    NA
    8          NA         NA                    NA                    NA
    9          NA         NA                    NA                    NA
    10         NA         NA                    NA                    NA
    11         NA         NA                    NA                    NA
    12         NA         NA                    NA                    NA
    13         NA         NA                    NA                    NA
    14         NA         NA                    NA                    NA
    15         NA         NA                    NA                    NA
    16         NA         NA                    NA                    NA
    17         NA         NA                    NA                    NA
    18         NA         NA                    NA                    NA
    19         NA         NA                    NA                    NA
    20         NA         NA                    NA                    NA
    21         NA         NA                    NA                    NA
    22         NA         NA                    NA                    NA
    23         NA         NA                    NA                    NA
    24         NA         NA                    NA                    NA
    25         NA         NA                    NA                    NA
    26         NA         NA                    NA                    NA
    27         NA         NA                    NA                    NA
    28         NA         NA                    NA                    NA
    29         NA         NA                    NA                    NA
    30         NA         NA                    NA                    NA
    31         NA         NA                    NA                    NA
    32         NA         NA                    NA                    NA
    33         NA         NA                    NA                    NA
    34         NA         NA                    NA                    NA
    35         NA         NA                    NA                    NA
    36         NA         NA                    NA                    NA
    37         NA         NA                    NA                    NA
    38         NA         NA                    NA                    NA
    39         NA         NA                    NA                    NA
    40         NA         NA                    NA                    NA
    41         NA         NA                    NA                    NA
    42         NA         NA                    NA                    NA
    43         NA         NA                    NA                    NA
    44         NA         NA                    NA                    NA
    45         NA         NA                    NA                    NA
    46         NA         NA                    NA                    NA
    47         NA         NA                    NA                    NA
    48         NA         NA                    NA                    NA
    49         NA         NA                    NA                    NA
    50         NA         NA                    NA                    NA
    51         NA         NA                    NA                    NA
    52         NA         NA                    NA                    NA
    53         NA         NA                    NA                    NA
    54         NA         NA                    NA                    NA
    55         NA         NA                    NA                    NA
    56         NA         NA                    NA                    NA
    57         NA         NA                    NA                    NA
    58         NA         NA                    NA                    NA
    59         NA         NA                    NA                    NA
    60         NA         NA                    NA                    NA
    61         NA         NA                    NA                    NA
    62         NA         NA                    NA                    NA
    63         NA         NA                    NA                    NA
       goalie_ev_savepct goalie_pp_shotagainst goalie_pp_goalagainst
    1                 NA                    NA                    NA
    2                 NA                    NA                    NA
    3                 NA                    NA                    NA
    4                 NA                    NA                    NA
    5                 NA                    NA                    NA
    6                 NA                    NA                    NA
    7                 NA                    NA                    NA
    8                 NA                    NA                    NA
    9                 NA                    NA                    NA
    10                NA                    NA                    NA
    11                NA                    NA                    NA
    12                NA                    NA                    NA
    13                NA                    NA                    NA
    14                NA                    NA                    NA
    15                NA                    NA                    NA
    16                NA                    NA                    NA
    17                NA                    NA                    NA
    18                NA                    NA                    NA
    19                NA                    NA                    NA
    20                NA                    NA                    NA
    21                NA                    NA                    NA
    22                NA                    NA                    NA
    23                NA                    NA                    NA
    24                NA                    NA                    NA
    25                NA                    NA                    NA
    26                NA                    NA                    NA
    27                NA                    NA                    NA
    28                NA                    NA                    NA
    29                NA                    NA                    NA
    30                NA                    NA                    NA
    31                NA                    NA                    NA
    32                NA                    NA                    NA
    33                NA                    NA                    NA
    34                NA                    NA                    NA
    35                NA                    NA                    NA
    36                NA                    NA                    NA
    37                NA                    NA                    NA
    38                NA                    NA                    NA
    39                NA                    NA                    NA
    40                NA                    NA                    NA
    41                NA                    NA                    NA
    42                NA                    NA                    NA
    43                NA                    NA                    NA
    44                NA                    NA                    NA
    45                NA                    NA                    NA
    46                NA                    NA                    NA
    47                NA                    NA                    NA
    48                NA                    NA                    NA
    49                NA                    NA                    NA
    50                NA                    NA                    NA
    51                NA                    NA                    NA
    52                NA                    NA                    NA
    53                NA                    NA                    NA
    54                NA                    NA                    NA
    55                NA                    NA                    NA
    56                NA                    NA                    NA
    57                NA                    NA                    NA
    58                NA                    NA                    NA
    59                NA                    NA                    NA
    60                NA                    NA                    NA
    61                NA                    NA                    NA
    62                NA                    NA                    NA
    63                NA                    NA                    NA
       goalie_pp_savepct goalie_pk_shotagainst goalie_pk_goalagainst
    1                 NA                    NA                    NA
    2                 NA                    NA                    NA
    3                 NA                    NA                    NA
    4                 NA                    NA                    NA
    5                 NA                    NA                    NA
    6                 NA                    NA                    NA
    7                 NA                    NA                    NA
    8                 NA                    NA                    NA
    9                 NA                    NA                    NA
    10                NA                    NA                    NA
    11                NA                    NA                    NA
    12                NA                    NA                    NA
    13                NA                    NA                    NA
    14                NA                    NA                    NA
    15                NA                    NA                    NA
    16                NA                    NA                    NA
    17                NA                    NA                    NA
    18                NA                    NA                    NA
    19                NA                    NA                    NA
    20                NA                    NA                    NA
    21                NA                    NA                    NA
    22                NA                    NA                    NA
    23                NA                    NA                    NA
    24                NA                    NA                    NA
    25                NA                    NA                    NA
    26                NA                    NA                    NA
    27                NA                    NA                    NA
    28                NA                    NA                    NA
    29                NA                    NA                    NA
    30                NA                    NA                    NA
    31                NA                    NA                    NA
    32                NA                    NA                    NA
    33                NA                    NA                    NA
    34                NA                    NA                    NA
    35                NA                    NA                    NA
    36                NA                    NA                    NA
    37                NA                    NA                    NA
    38                NA                    NA                    NA
    39                NA                    NA                    NA
    40                NA                    NA                    NA
    41                NA                    NA                    NA
    42                NA                    NA                    NA
    43                NA                    NA                    NA
    44                NA                    NA                    NA
    45                NA                    NA                    NA
    46                NA                    NA                    NA
    47                NA                    NA                    NA
    48                NA                    NA                    NA
    49                NA                    NA                    NA
    50                NA                    NA                    NA
    51                NA                    NA                    NA
    52                NA                    NA                    NA
    53                NA                    NA                    NA
    54                NA                    NA                    NA
    55                NA                    NA                    NA
    56                NA                    NA                    NA
    57                NA                    NA                    NA
    58                NA                    NA                    NA
    59                NA                    NA                    NA
    60                NA                    NA                    NA
    61                NA                    NA                    NA
    62                NA                    NA                    NA
    63                NA                    NA                    NA
       goalie_pk_savepct
    1                 NA
    2                 NA
    3                 NA
    4                 NA
    5                 NA
    6                 NA
    7                 NA
    8                 NA
    9                 NA
    10                NA
    11                NA
    12                NA
    13                NA
    14                NA
    15                NA
    16                NA
    17                NA
    18                NA
    19                NA
    20                NA
    21                NA
    22                NA
    23                NA
    24                NA
    25                NA
    26                NA
    27                NA
    28                NA
    29                NA
    30                NA
    31                NA
    32                NA
    33                NA
    34                NA
    35                NA
    36                NA
    37                NA
    38                NA
    39                NA
    40                NA
    41                NA
    42                NA
    43                NA
    44                NA
    45                NA
    46                NA
    47                NA
    48                NA
    49                NA
    50                NA
    51                NA
    52                NA
    53                NA
    54                NA
    55                NA
    56                NA
    57                NA
    58                NA
    59                NA
    60                NA
    61                NA
    62                NA
    63                NA

---

         player_name season_years season_type team_abbreviation skater_games
    1  Curtis Joseph      1989-90     regular               STL           NA
    2  Curtis Joseph      1989-90    playoffs               STL           NA
    3  Curtis Joseph      1989-90    playoffs               STL           NA
    4  Curtis Joseph      1990-91     regular               STL           NA
    5  Curtis Joseph      1991-92     regular               STL           NA
    6  Curtis Joseph      1991-92    playoffs               STL           NA
    7  Curtis Joseph      1992-93     regular               STL           NA
    8  Curtis Joseph      1992-93    playoffs               STL           NA
    9  Curtis Joseph      1993-94     regular               STL           NA
    10 Curtis Joseph      1993-94    playoffs               STL           NA
    11 Curtis Joseph      1994-95     regular               STL           NA
    12 Curtis Joseph      1994-95    playoffs               STL           NA
    13 Curtis Joseph      1995-96     regular               EDM           NA
    14 Curtis Joseph      1996-97     regular               EDM           NA
    15 Curtis Joseph      1996-97    playoffs               EDM           NA
    16 Curtis Joseph      1997-98     regular               EDM           NA
    17 Curtis Joseph      1997-98    playoffs               EDM           NA
    18 Curtis Joseph      1998-99     regular               TOR           NA
    19 Curtis Joseph      1998-99    playoffs               TOR           NA
    20 Curtis Joseph      1999-00     regular               TOR           NA
    21 Curtis Joseph      1999-00    playoffs               TOR           NA
    22 Curtis Joseph      2000-01     regular               TOR           NA
    23 Curtis Joseph      2000-01    playoffs               TOR           NA
    24 Curtis Joseph      2001-02     regular               TOR           NA
    25 Curtis Joseph      2001-02    playoffs               TOR           NA
    26 Curtis Joseph      2002-03     regular               DET           NA
    27 Curtis Joseph      2002-03    playoffs               DET           NA
    28 Curtis Joseph      2003-04     regular               DET           NA
    29 Curtis Joseph      2003-04    playoffs               DET           NA
    30 Curtis Joseph      2005-06     regular               PHX           NA
    31 Curtis Joseph      2006-07     regular               PHX           NA
    32 Curtis Joseph      2007-08     regular               CGY           NA
    33 Curtis Joseph      2007-08    playoffs               CGY           NA
    34 Curtis Joseph      2008-09     regular               TOR           NA
    35    Marc Denis      1996-97     regular               COL           NA
    36    Marc Denis      1998-99     regular               COL           NA
    37    Marc Denis      1999-00     regular               COL           NA
    38    Marc Denis      2000-01     regular               CBJ           NA
    39    Marc Denis      2001-02     regular               CBJ           NA
    40    Marc Denis      2002-03     regular               CBJ           NA
    41    Marc Denis      2003-04     regular               CBJ           NA
    42    Marc Denis      2005-06     regular               CBJ           NA
    43    Marc Denis      2006-07     regular               TBL           NA
    44    Marc Denis      2007-08     regular               TBL           NA
    45    Marc Denis      2008-09     regular               MTL           NA
       skater_goals skater_assists skater_points skater_plusminus skater_pim
    1            NA             NA            NA               NA         NA
    2            NA             NA            NA               NA         NA
    3            NA             NA            NA               NA         NA
    4            NA             NA            NA               NA         NA
    5            NA             NA            NA               NA         NA
    6            NA             NA            NA               NA         NA
    7            NA             NA            NA               NA         NA
    8            NA             NA            NA               NA         NA
    9            NA             NA            NA               NA         NA
    10           NA             NA            NA               NA         NA
    11           NA             NA            NA               NA         NA
    12           NA             NA            NA               NA         NA
    13           NA             NA            NA               NA         NA
    14           NA             NA            NA               NA         NA
    15           NA             NA            NA               NA         NA
    16           NA             NA            NA               NA         NA
    17           NA             NA            NA               NA         NA
    18           NA             NA            NA               NA         NA
    19           NA             NA            NA               NA         NA
    20           NA             NA            NA               NA         NA
    21           NA             NA            NA               NA         NA
    22           NA             NA            NA               NA         NA
    23           NA             NA            NA               NA         NA
    24           NA             NA            NA               NA         NA
    25           NA             NA            NA               NA         NA
    26           NA             NA            NA               NA         NA
    27           NA             NA            NA               NA         NA
    28           NA             NA            NA               NA         NA
    29           NA             NA            NA               NA         NA
    30           NA             NA            NA               NA         NA
    31           NA             NA            NA               NA         NA
    32           NA             NA            NA               NA         NA
    33           NA             NA            NA               NA         NA
    34           NA             NA            NA               NA         NA
    35           NA             NA            NA               NA         NA
    36           NA             NA            NA               NA         NA
    37           NA             NA            NA               NA         NA
    38           NA             NA            NA               NA         NA
    39           NA             NA            NA               NA         NA
    40           NA             NA            NA               NA         NA
    41           NA             NA            NA               NA         NA
    42           NA             NA            NA               NA         NA
    43           NA             NA            NA               NA         NA
    44           NA             NA            NA               NA         NA
    45           NA             NA            NA               NA         NA
       skater_toi skater_shifts skater_gwg skater_otg skater_shots skater_blocked
    1          NA            NA         NA         NA           NA             NA
    2          NA            NA         NA         NA           NA             NA
    3          NA            NA         NA         NA           NA             NA
    4          NA            NA         NA         NA           NA             NA
    5          NA            NA         NA         NA           NA             NA
    6          NA            NA         NA         NA           NA             NA
    7          NA            NA         NA         NA           NA             NA
    8          NA            NA         NA         NA           NA             NA
    9          NA            NA         NA         NA           NA             NA
    10         NA            NA         NA         NA           NA             NA
    11         NA            NA         NA         NA           NA             NA
    12         NA            NA         NA         NA           NA             NA
    13         NA            NA         NA         NA           NA             NA
    14         NA            NA         NA         NA           NA             NA
    15         NA            NA         NA         NA           NA             NA
    16         NA            NA         NA         NA           NA             NA
    17         NA            NA         NA         NA           NA             NA
    18         NA            NA         NA         NA           NA             NA
    19         NA            NA         NA         NA           NA             NA
    20         NA            NA         NA         NA           NA             NA
    21         NA            NA         NA         NA           NA             NA
    22         NA            NA         NA         NA           NA             NA
    23         NA            NA         NA         NA           NA             NA
    24         NA            NA         NA         NA           NA             NA
    25         NA            NA         NA         NA           NA             NA
    26         NA            NA         NA         NA           NA             NA
    27         NA            NA         NA         NA           NA             NA
    28         NA            NA         NA         NA           NA             NA
    29         NA            NA         NA         NA           NA             NA
    30         NA            NA         NA         NA           NA             NA
    31         NA            NA         NA         NA           NA             NA
    32         NA            NA         NA         NA           NA             NA
    33         NA            NA         NA         NA           NA             NA
    34         NA            NA         NA         NA           NA             NA
    35         NA            NA         NA         NA           NA             NA
    36         NA            NA         NA         NA           NA             NA
    37         NA            NA         NA         NA           NA             NA
    38         NA            NA         NA         NA           NA             NA
    39         NA            NA         NA         NA           NA             NA
    40         NA            NA         NA         NA           NA             NA
    41         NA            NA         NA         NA           NA             NA
    42         NA            NA         NA         NA           NA             NA
    43         NA            NA         NA         NA           NA             NA
    44         NA            NA         NA         NA           NA             NA
    45         NA            NA         NA         NA           NA             NA
       skater_hits skater_ev_goals skater_ev_assists skater_ev_points skater_ev_toi
    1           NA              NA                NA               NA            NA
    2           NA              NA                NA               NA            NA
    3           NA              NA                NA               NA            NA
    4           NA              NA                NA               NA            NA
    5           NA              NA                NA               NA            NA
    6           NA              NA                NA               NA            NA
    7           NA              NA                NA               NA            NA
    8           NA              NA                NA               NA            NA
    9           NA              NA                NA               NA            NA
    10          NA              NA                NA               NA            NA
    11          NA              NA                NA               NA            NA
    12          NA              NA                NA               NA            NA
    13          NA              NA                NA               NA            NA
    14          NA              NA                NA               NA            NA
    15          NA              NA                NA               NA            NA
    16          NA              NA                NA               NA            NA
    17          NA              NA                NA               NA            NA
    18          NA              NA                NA               NA            NA
    19          NA              NA                NA               NA            NA
    20          NA              NA                NA               NA            NA
    21          NA              NA                NA               NA            NA
    22          NA              NA                NA               NA            NA
    23          NA              NA                NA               NA            NA
    24          NA              NA                NA               NA            NA
    25          NA              NA                NA               NA            NA
    26          NA              NA                NA               NA            NA
    27          NA              NA                NA               NA            NA
    28          NA              NA                NA               NA            NA
    29          NA              NA                NA               NA            NA
    30          NA              NA                NA               NA            NA
    31          NA              NA                NA               NA            NA
    32          NA              NA                NA               NA            NA
    33          NA              NA                NA               NA            NA
    34          NA              NA                NA               NA            NA
    35          NA              NA                NA               NA            NA
    36          NA              NA                NA               NA            NA
    37          NA              NA                NA               NA            NA
    38          NA              NA                NA               NA            NA
    39          NA              NA                NA               NA            NA
    40          NA              NA                NA               NA            NA
    41          NA              NA                NA               NA            NA
    42          NA              NA                NA               NA            NA
    43          NA              NA                NA               NA            NA
    44          NA              NA                NA               NA            NA
    45          NA              NA                NA               NA            NA
       skater_pp_goals skater_pp_assists skater_pp_points skater_pp_toi
    1               NA                NA               NA            NA
    2               NA                NA               NA            NA
    3               NA                NA               NA            NA
    4               NA                NA               NA            NA
    5               NA                NA               NA            NA
    6               NA                NA               NA            NA
    7               NA                NA               NA            NA
    8               NA                NA               NA            NA
    9               NA                NA               NA            NA
    10              NA                NA               NA            NA
    11              NA                NA               NA            NA
    12              NA                NA               NA            NA
    13              NA                NA               NA            NA
    14              NA                NA               NA            NA
    15              NA                NA               NA            NA
    16              NA                NA               NA            NA
    17              NA                NA               NA            NA
    18              NA                NA               NA            NA
    19              NA                NA               NA            NA
    20              NA                NA               NA            NA
    21              NA                NA               NA            NA
    22              NA                NA               NA            NA
    23              NA                NA               NA            NA
    24              NA                NA               NA            NA
    25              NA                NA               NA            NA
    26              NA                NA               NA            NA
    27              NA                NA               NA            NA
    28              NA                NA               NA            NA
    29              NA                NA               NA            NA
    30              NA                NA               NA            NA
    31              NA                NA               NA            NA
    32              NA                NA               NA            NA
    33              NA                NA               NA            NA
    34              NA                NA               NA            NA
    35              NA                NA               NA            NA
    36              NA                NA               NA            NA
    37              NA                NA               NA            NA
    38              NA                NA               NA            NA
    39              NA                NA               NA            NA
    40              NA                NA               NA            NA
    41              NA                NA               NA            NA
    42              NA                NA               NA            NA
    43              NA                NA               NA            NA
    44              NA                NA               NA            NA
    45              NA                NA               NA            NA
       skater_pk_goals skater_pk_assists skater_pk_points skater_pk_toi
    1               NA                NA               NA            NA
    2               NA                NA               NA            NA
    3               NA                NA               NA            NA
    4               NA                NA               NA            NA
    5               NA                NA               NA            NA
    6               NA                NA               NA            NA
    7               NA                NA               NA            NA
    8               NA                NA               NA            NA
    9               NA                NA               NA            NA
    10              NA                NA               NA            NA
    11              NA                NA               NA            NA
    12              NA                NA               NA            NA
    13              NA                NA               NA            NA
    14              NA                NA               NA            NA
    15              NA                NA               NA            NA
    16              NA                NA               NA            NA
    17              NA                NA               NA            NA
    18              NA                NA               NA            NA
    19              NA                NA               NA            NA
    20              NA                NA               NA            NA
    21              NA                NA               NA            NA
    22              NA                NA               NA            NA
    23              NA                NA               NA            NA
    24              NA                NA               NA            NA
    25              NA                NA               NA            NA
    26              NA                NA               NA            NA
    27              NA                NA               NA            NA
    28              NA                NA               NA            NA
    29              NA                NA               NA            NA
    30              NA                NA               NA            NA
    31              NA                NA               NA            NA
    32              NA                NA               NA            NA
    33              NA                NA               NA            NA
    34              NA                NA               NA            NA
    35              NA                NA               NA            NA
    36              NA                NA               NA            NA
    37              NA                NA               NA            NA
    38              NA                NA               NA            NA
    39              NA                NA               NA            NA
    40              NA                NA               NA            NA
    41              NA                NA               NA            NA
    42              NA                NA               NA            NA
    43              NA                NA               NA            NA
    44              NA                NA               NA            NA
    45              NA                NA               NA            NA
       goalie_games goalie_started goalie_wins goalie_losses goalie_ties goalie_ot
    1            15             14           9             5           1        NA
    2             6              5           4             1          NA        NA
    3             6             NA           4             1          NA         0
    4            30             29          16            10           2        NA
    5            60             58          27            20          10        NA
    6             6              6           2             4          NA        NA
    7            68             67          29            28           9        NA
    8            11             11           7             4          NA        NA
    9            71             71          36            23          11        NA
    10            4              4           0             4          NA        NA
    11           36             36          20            10           1        NA
    12            7              7           3             3          NA        NA
    13           34             34          15            16           2        NA
    14           72             72          32            29           9        NA
    15           12             12           5             7          NA        NA
    16           71             71          29            31           9        NA
    17           12             12           5             7          NA        NA
    18           67             67          35            24           7        NA
    19           17             17           9             8          NA        NA
    20           63             63          36            20           7        NA
    21           12             12           6             6          NA        NA
    22           68             68          33            27           8        NA
    23           11             11           7             4          NA        NA
    24           51             51          29            17           5        NA
    25           20             20          10            10          NA        NA
    26           61             60          34            19           6        NA
    27            4              4           0             4          NA        NA
    28           31             30          16            10           3        NA
    29            9              8           4             4          NA        NA
    30           60             59          32            21          NA         3
    31           55             50          18            31          NA         2
    32            9              5           3             2          NA         0
    33            2              0           1             0          NA        NA
    34           21             11           5             9          NA         1
    35            1              1           0             1           0        NA
    36            4              3           1             1           1        NA
    37           23             20           9             8           3        NA
    38           32             29           6            20           4        NA
    39           42             39           9            24           5        NA
    40           77             77          27            41           8        NA
    41           66             63          21            36           7        NA
    42           49             45          21            25          NA         1
    43           44             39          17            18          NA         2
    44           10              4           1             5          NA         0
    45            1              0           0             0          NA         0
       goalie_shutouts goalie_shotagainst goalie_goalagainst goalie_savepct
    1                0                435                 48      0.8896552
    2                0                166                 18      0.8915663
    3                0                167                 18      0.8922156
    4                0                874                 89      0.8981693
    5                2               1953                175      0.9103943
    6                0                217                 23      0.8940092
    7                1               2202                196      0.9109900
    8                2                438                 27      0.9383562
    9                1               2382                213      0.9105793
    10               0                158                 15      0.9050633
    11               1                904                 89      0.9015487
    12               0                178                 24      0.8651685
    13               0                971                111      0.8856849
    14               6               2144                200      0.9067164
    15               2                405                 36      0.9111111
    16               8               1901                181      0.9047870
    17               3                319                 23      0.9278997
    18               3               1903                171      0.9101419
    19               1                440                 41      0.9068182
    20               4               1854                158      0.9147789
    21               1                369                 25      0.9322493
    22               6               1907                163      0.9145254
    23               3                329                 24      0.9270517
    24               4               1210                114      0.9057851
    25               3                557                 48      0.9138241
    26               5               1676                148      0.9116945
    27               0                120                 10      0.9166667
    28               2                744                 68      0.9086022
    29               1                197                 12      0.9390863
    30               4               1690                166      0.9017751
    31               4               1481                159      0.8926401
    32               0                181                 17      0.9060773
    33               0                 33                  1      0.9696970
    34               0                383                 50      0.8694517
    35               0                 26                  3      0.8846154
    36               0                110                  9      0.9181818
    37               3                618                 51      0.9174757
    38               0                940                 99      0.8946809
    39               1               1197                121      0.8989140
    40               5               2404                232      0.9034942
    41               5               1970                162      0.9177665
    42               1               1505                151      0.8996678
    43               1               1068                125      0.8829588
    44               0                199                 28      0.8592965
    45               0                  7                  1      0.8571429
       goalie_gaa goalie_toi goalie_ev_shotagainst goalie_ev_goalagainst
    1   3.3815385  851.68333                    35                    35
    2   3.3046050  326.81667                    11                    11
    3   3.3027523  327.00000                    NA                    NA
    4   3.1220767 1710.40000                    63                    63
    5   3.0055531 3493.53333                   126                   126
    6   3.6381212  379.31667                    13                    13
    7   3.0230067 3890.16667                   142                   142
    8   2.2670554  714.58333                    18                    18
    9   3.0969430 4126.65000                   150                   150
    10  3.6637492  245.65000                     9                     9
    11  2.7902602 1913.80000                    57                    57
    12  3.6755009  391.78333                     8                     8
    13  3.4407047 1935.65000                    74                    74
    14  2.9265794 4100.35000                   137                   137
    15  2.8148824  767.35000                    25                    25
    16  2.6280552 4132.33333                  1430                   118
    17  1.9277333  715.86667                   224                    15
    18  2.5642735 4001.13333                  1458                   118
    19  2.4341172 1010.63333                   317                    26
    20  2.4940258 3801.08333                  1424                   108
    21  2.0576132  729.00000                   287                    17
    22  2.3853271 4100.06667                  1446                   111
    23  2.1023944  684.93333                   248                    18
    24  2.2317083 3064.91667                   947                    80
    25  2.2980863 1253.21667                   420                    27
    26  2.4898709 3566.45000                  1264                   102
    27  2.0787620  288.63333                    87                    10
    28  2.3888054 1707.96667                   550                    48
    29  1.3911251  517.56667                   168                    10
    30  2.9087086 3424.20000                  1143                   100
    31  3.1871179 2993.30000                  1093                   102
    32  2.5521268  399.66667                   140                    11
    33  0.7559849   79.36667                    27                     1
    34  3.5684549  840.70000                   316                    34
    35  3.0184461   59.63333                     3                     3
    36  2.4905834  216.81667                    79                     6
    37  2.5426546 1203.46667                   486                    37
    38  3.2454583 1830.25000                   713                    61
    39  3.1085643 2335.48333                   956                    95
    40  3.0858473 4510.91667                  1822                   174
    41  2.5607475 3795.76667                  1557                   123
    42  3.2516240 2786.30000                  1060                    97
    43  3.1880526 2352.53333                   855                    83
    44  4.0488432  414.93333                   152                    21
    45  3.0000000   20.00000                     4                     1
       goalie_ev_savepct goalie_pp_shotagainst goalie_pp_goalagainst
    1          0.0000000                    10                    10
    2          0.0000000                     5                     5
    3                 NA                    NA                    NA
    4          0.0000000                    20                    20
    5          0.0000000                    40                    40
    6          0.0000000                     9                     9
    7          0.0000000                    48                    48
    8          0.0000000                     9                     9
    9          0.0000000                    53                    53
    10         0.0000000                     6                     6
    11         0.0000000                    30                    30
    12         0.0000000                    10                    10
    13         0.0000000                    33                    33
    14         0.0000000                    52                    52
    15         0.0000000                    10                    10
    16         0.9174825                   446                    55
    17         0.9330357                    77                     7
    18         0.9190672                   371                    48
    19         0.9179811                   102                    13
    20         0.9241573                   357                    46
    21         0.9407666                    68                     7
    22         0.9232365                   391                    44
    23         0.9274194                    70                     6
    24         0.9155227                   230                    31
    25         0.9357143                   119                    20
    26         0.9193038                   364                    43
    27         0.8850575                    27                     0
    28         0.9127273                   167                    18
    29         0.9404762                    24                     2
    30         0.9125109                   450                    60
    31         0.9066789                   330                    48
    32         0.9214286                    34                     6
    33         0.9629630                     6                     0
    34         0.8924051                    59                    16
    35         0.0000000                     0                     0
    36         0.9240506                    27                     3
    37         0.9238683                   115                    13
    38         0.9144460                   189                    33
    39         0.9006276                   191                    22
    40         0.9045005                   469                    52
    41         0.9210019                   335                    30
    42         0.9084906                   384                    48
    43         0.9029240                   173                    36
    44         0.8618421                    39                     6
    45         0.7500000                     2                     0
       goalie_pp_savepct goalie_pk_shotagainst goalie_pk_goalagainst
    1          0.0000000                     3                     3
    2          0.0000000                     2                     2
    3                 NA                    NA                    NA
    4          0.0000000                     6                     6
    5          0.0000000                     9                     9
    6          0.0000000                     1                     1
    7          0.0000000                     6                     6
    8          0.0000000                     0                     0
    9          0.0000000                    10                    10
    10         0.0000000                     0                     0
    11         0.0000000                     2                     2
    12         0.0000000                     6                     6
    13         0.0000000                     4                     4
    14         0.0000000                    10                    10
    15         0.0000000                     1                     1
    16         0.8766816                    67                     8
    17         0.9090909                    18                     1
    18         0.8706199                    73                     4
    19         0.8725490                    21                     2
    20         0.8711485                    73                     4
    21         0.8970588                    14                     1
    22         0.8874680                    70                     8
    23         0.9142857                    11                     0
    24         0.8652174                    33                     2
    25         0.8319328                    18                     0
    26         0.8818681                    48                     3
    27         1.0000000                     6                     0
    28         0.8922156                    27                     2
    29         0.9166667                     5                     0
    30         0.8666667                    97                     5
    31         0.8545455                    58                     7
    32         0.8235294                     7                     0
    33         1.0000000                     0                     0
    34         0.7288136                     8                     0
    35               NaN                     0                     0
    36         0.8888889                     4                     0
    37         0.8869565                    17                     1
    38         0.8253968                    38                     5
    39         0.8848168                    50                     3
    40         0.8891258                   113                     6
    41         0.9104478                    84                     9
    42         0.8750000                    61                     6
    43         0.7919075                    40                     5
    44         0.8461538                     8                     1
    45         1.0000000                     1                     0
       goalie_pk_savepct
    1          0.0000000
    2          0.0000000
    3                 NA
    4          0.0000000
    5          0.0000000
    6          0.0000000
    7          0.0000000
    8                NaN
    9          0.0000000
    10               NaN
    11         0.0000000
    12         0.0000000
    13         0.0000000
    14         0.0000000
    15         0.0000000
    16         0.8805970
    17         0.9444444
    18         0.9452055
    19         0.9047619
    20         0.9452055
    21         0.9285714
    22         0.8857143
    23         1.0000000
    24         0.9393939
    25         1.0000000
    26         0.9375000
    27         1.0000000
    28         0.9259259
    29         1.0000000
    30         0.9484536
    31         0.8793103
    32         1.0000000
    33               NaN
    34         1.0000000
    35               NaN
    36         1.0000000
    37         0.9411765
    38         0.8684211
    39         0.9400000
    40         0.9469027
    41         0.8928571
    42         0.9016393
    43         0.8750000
    44         0.8750000
    45         1.0000000

---

         player_name season_years season_type team_abbreviation skater_games
    1  Curtis Joseph      1989-90     regular               STL           NA
    2  Curtis Joseph      1989-90    playoffs               STL           NA
    3  Curtis Joseph      1989-90    playoffs               STL           NA
    4  Curtis Joseph      1990-91     regular               STL           NA
    5  Curtis Joseph      1991-92     regular               STL           NA
    6  Curtis Joseph      1991-92    playoffs               STL           NA
    7  Curtis Joseph      1992-93     regular               STL           NA
    8  Curtis Joseph      1992-93    playoffs               STL           NA
    9  Curtis Joseph      1993-94     regular               STL           NA
    10 Curtis Joseph      1993-94    playoffs               STL           NA
    11 Curtis Joseph      1994-95     regular               STL           NA
    12 Curtis Joseph      1994-95    playoffs               STL           NA
    13 Curtis Joseph      1995-96     regular               EDM           NA
    14 Curtis Joseph      1996-97     regular               EDM           NA
    15 Curtis Joseph      1996-97    playoffs               EDM           NA
    16 Curtis Joseph      1997-98     regular               EDM           NA
    17 Curtis Joseph      1997-98    playoffs               EDM           NA
    18 Curtis Joseph      1998-99     regular               TOR           NA
    19 Curtis Joseph      1998-99    playoffs               TOR           NA
    20 Curtis Joseph      1999-00     regular               TOR           NA
    21 Curtis Joseph      1999-00    playoffs               TOR           NA
    22 Curtis Joseph      2000-01     regular               TOR           NA
    23 Curtis Joseph      2000-01    playoffs               TOR           NA
    24 Curtis Joseph      2001-02     regular               TOR           NA
    25 Curtis Joseph      2001-02    playoffs               TOR           NA
    26 Curtis Joseph      2002-03     regular               DET           NA
    27 Curtis Joseph      2002-03    playoffs               DET           NA
    28 Curtis Joseph      2003-04     regular               DET           NA
    29 Curtis Joseph      2003-04    playoffs               DET           NA
    30 Curtis Joseph      2005-06     regular               PHX           NA
    31 Curtis Joseph      2006-07     regular               PHX           NA
    32 Curtis Joseph      2007-08     regular               CGY           NA
    33 Curtis Joseph      2007-08    playoffs               CGY           NA
    34 Curtis Joseph      2008-09     regular               TOR           NA
    35   Paul Kariya      1994-95     regular               ANA           47
    36   Paul Kariya      1995-96     regular               ANA           82
    37   Paul Kariya      1996-97     regular               ANA           69
    38   Paul Kariya      1996-97    playoffs               ANA           11
    39   Paul Kariya      1997-98     regular               ANA           22
    40   Paul Kariya      1998-99     regular               ANA           82
    41   Paul Kariya      1998-99    playoffs               ANA            3
    42   Paul Kariya      1999-00     regular               ANA           74
    43   Paul Kariya      2000-01     regular               ANA           66
    44   Paul Kariya      2001-02     regular               ANA           82
    45   Paul Kariya      2002-03     regular               ANA           82
    46   Paul Kariya      2002-03    playoffs               ANA           21
    47   Paul Kariya      2003-04     regular               COL           51
    48   Paul Kariya      2003-04    playoffs               COL            1
    49   Paul Kariya      2005-06     regular               NSH           82
    50   Paul Kariya      2005-06    playoffs               NSH            5
    51   Paul Kariya      2006-07     regular               NSH           82
    52   Paul Kariya      2006-07    playoffs               NSH            5
    53   Paul Kariya      2007-08     regular               STL           82
    54   Paul Kariya      2008-09     regular               STL           11
    55   Paul Kariya      2009-10     regular               STL           75
       skater_goals skater_assists skater_points skater_plusminus skater_pim
    1            NA             NA            NA               NA         NA
    2            NA             NA            NA               NA         NA
    3            NA             NA            NA               NA         NA
    4            NA             NA            NA               NA         NA
    5            NA             NA            NA               NA         NA
    6            NA             NA            NA               NA         NA
    7            NA             NA            NA               NA         NA
    8            NA             NA            NA               NA         NA
    9            NA             NA            NA               NA         NA
    10           NA             NA            NA               NA         NA
    11           NA             NA            NA               NA         NA
    12           NA             NA            NA               NA         NA
    13           NA             NA            NA               NA         NA
    14           NA             NA            NA               NA         NA
    15           NA             NA            NA               NA         NA
    16           NA             NA            NA               NA         NA
    17           NA             NA            NA               NA         NA
    18           NA             NA            NA               NA         NA
    19           NA             NA            NA               NA         NA
    20           NA             NA            NA               NA         NA
    21           NA             NA            NA               NA         NA
    22           NA             NA            NA               NA         NA
    23           NA             NA            NA               NA         NA
    24           NA             NA            NA               NA         NA
    25           NA             NA            NA               NA         NA
    26           NA             NA            NA               NA         NA
    27           NA             NA            NA               NA         NA
    28           NA             NA            NA               NA         NA
    29           NA             NA            NA               NA         NA
    30           NA             NA            NA               NA         NA
    31           NA             NA            NA               NA         NA
    32           NA             NA            NA               NA         NA
    33           NA             NA            NA               NA         NA
    34           NA             NA            NA               NA         NA
    35           18             21            39              -17          4
    36           50             58           108                9         20
    37           44             55            99               36          6
    38            7              6            13               -2          4
    39           17             14            31               12         23
    40           39             62           101               17         40
    41            1              3             4                0          0
    42           42             44            86               22         24
    43           33             34            67               -9         20
    44           32             25            57              -15         28
    45           25             56            81               -3         48
    46            6              6            12                0          6
    47           11             25            36               -5         22
    48            0              1             1               -1          0
    49           31             54            85               -6         40
    50            2              5             7                0          0
    51           24             52            76                6         36
    52            0              2             2               -4          2
    53           16             49            65              -10         50
    54            2             13            15                1          2
    55           18             25            43               -7         36
       skater_toi skater_shifts skater_gwg skater_otg skater_shots skater_blocked
    1          NA            NA         NA         NA           NA             NA
    2          NA            NA         NA         NA           NA             NA
    3          NA            NA         NA         NA           NA             NA
    4          NA            NA         NA         NA           NA             NA
    5          NA            NA         NA         NA           NA             NA
    6          NA            NA         NA         NA           NA             NA
    7          NA            NA         NA         NA           NA             NA
    8          NA            NA         NA         NA           NA             NA
    9          NA            NA         NA         NA           NA             NA
    10         NA            NA         NA         NA           NA             NA
    11         NA            NA         NA         NA           NA             NA
    12         NA            NA         NA         NA           NA             NA
    13         NA            NA         NA         NA           NA             NA
    14         NA            NA         NA         NA           NA             NA
    15         NA            NA         NA         NA           NA             NA
    16         NA            NA         NA         NA           NA             NA
    17         NA            NA         NA         NA           NA             NA
    18         NA            NA         NA         NA           NA             NA
    19         NA            NA         NA         NA           NA             NA
    20         NA            NA         NA         NA           NA             NA
    21         NA            NA         NA         NA           NA             NA
    22         NA            NA         NA         NA           NA             NA
    23         NA            NA         NA         NA           NA             NA
    24         NA            NA         NA         NA           NA             NA
    25         NA            NA         NA         NA           NA             NA
    26         NA            NA         NA         NA           NA             NA
    27         NA            NA         NA         NA           NA             NA
    28         NA            NA         NA         NA           NA             NA
    29         NA            NA         NA         NA           NA             NA
    30         NA            NA         NA         NA           NA             NA
    31         NA            NA         NA         NA           NA             NA
    32         NA            NA         NA         NA           NA             NA
    33         NA            NA         NA         NA           NA             NA
    34         NA            NA         NA         NA           NA             NA
    35         NA            NA          3          0          134             NA
    36         NA            NA          9          3          349             NA
    37         NA            NA         10          0          340             NA
    38         NA            NA          1          1           61             NA
    39   519.5000           601          2          0          103              0
    40  2094.3833          2201          4          0          429              0
    41    78.1500            86          0          0           11              0
    42  1802.9000          1951          3          0          324              0
    43  1520.1667          1635          3          0          230              0
    44  1821.7333          2040          8          0          289              0
    45  1663.6333          2213          2          0          257             10
    46   446.1500           641          1          1           53              0
    47   949.5833          1408          1          0          110              0
    48    16.0000            29          0          0            2              0
    49  1564.6500          1919          3          1          245             44
    50   103.9000           123          0          0           12              3
    51  1671.1833          2008          2          0          224             49
    52    98.0000           131          0          0           10              2
    53  1535.6500          1932          1          0          223             21
    54   199.1333           252          0          0           31              6
    55  1286.5000          1790          2          0          221             25
       skater_hits skater_ev_goals skater_ev_assists skater_ev_points skater_ev_toi
    1           NA              NA                NA               NA            NA
    2           NA              NA                NA               NA            NA
    3           NA              NA                NA               NA            NA
    4           NA              NA                NA               NA            NA
    5           NA              NA                NA               NA            NA
    6           NA              NA                NA               NA            NA
    7           NA              NA                NA               NA            NA
    8           NA              NA                NA               NA            NA
    9           NA              NA                NA               NA            NA
    10          NA              NA                NA               NA            NA
    11          NA              NA                NA               NA            NA
    12          NA              NA                NA               NA            NA
    13          NA              NA                NA               NA            NA
    14          NA              NA                NA               NA            NA
    15          NA              NA                NA               NA            NA
    16          NA              NA                NA               NA            NA
    17          NA              NA                NA               NA            NA
    18          NA              NA                NA               NA            NA
    19          NA              NA                NA               NA            NA
    20          NA              NA                NA               NA            NA
    21          NA              NA                NA               NA            NA
    22          NA              NA                NA               NA            NA
    23          NA              NA                NA               NA            NA
    24          NA              NA                NA               NA            NA
    25          NA              NA                NA               NA            NA
    26          NA              NA                NA               NA            NA
    27          NA              NA                NA               NA            NA
    28          NA              NA                NA               NA            NA
    29          NA              NA                NA               NA            NA
    30          NA              NA                NA               NA            NA
    31          NA              NA                NA               NA            NA
    32          NA              NA                NA               NA            NA
    33          NA              NA                NA               NA            NA
    34          NA              NA                NA               NA            NA
    35          NA              10                13               23            NA
    36          NA              27                34               61            NA
    37          NA              26                35               61            NA
    38          NA               3                 3                6            NA
    39          18              14                12               26     373.85000
    40          35              26                29               55    1379.55000
    41           3               1                 1                2      44.95000
    42          23              28                24               52    1269.13333
    43          19              12                18               30    1059.00000
    44          23              21                11               32    1280.35000
    45           8              13                32               45    1260.40000
    46           5               6                 3                9     381.71667
    47          27               5                15               20     681.70000
    48           0               0                 0                0      12.46667
    49          18              17                22               39    1011.91667
    50           1               0                 1                1      71.60000
    51          16              19                32               51    1232.43333
    52           5               0                 0                0      76.30000
    53          18              11                33               44    1182.58333
    54           7               2                 4                6     149.73333
    55          36              15                16               31    1041.68333
       skater_pp_goals skater_pp_assists skater_pp_points skater_pp_toi
    1               NA                NA               NA            NA
    2               NA                NA               NA            NA
    3               NA                NA               NA            NA
    4               NA                NA               NA            NA
    5               NA                NA               NA            NA
    6               NA                NA               NA            NA
    7               NA                NA               NA            NA
    8               NA                NA               NA            NA
    9               NA                NA               NA            NA
    10              NA                NA               NA            NA
    11              NA                NA               NA            NA
    12              NA                NA               NA            NA
    13              NA                NA               NA            NA
    14              NA                NA               NA            NA
    15              NA                NA               NA            NA
    16              NA                NA               NA            NA
    17              NA                NA               NA            NA
    18              NA                NA               NA            NA
    19              NA                NA               NA            NA
    20              NA                NA               NA            NA
    21              NA                NA               NA            NA
    22              NA                NA               NA            NA
    23              NA                NA               NA            NA
    24              NA                NA               NA            NA
    25              NA                NA               NA            NA
    26              NA                NA               NA            NA
    27              NA                NA               NA            NA
    28              NA                NA               NA            NA
    29              NA                NA               NA            NA
    30              NA                NA               NA            NA
    31              NA                NA               NA            NA
    32              NA                NA               NA            NA
    33              NA                NA               NA            NA
    34              NA                NA               NA            NA
    35               7                 8               15            NA
    36              20                21               41            NA
    37              15                19               34            NA
    38               4                 3                7            NA
    39               3                 2                5    107.533333
    40              11                32               43    475.616667
    41               0                 2                2     19.900000
    42              11                20               31    377.666667
    43              18                16               34    369.533333
    44              11                14               25    447.466667
    45              11                24               35    364.683333
    46               0                 3                3     61.716667
    47               5                 9               14    179.483333
    48               0                 1                1      3.116667
    49              14                32               46    501.016667
    50               2                 4                6     32.216667
    51               5                20               25    408.616667
    52               0                 2                2     17.716667
    53               5                16               21    346.333333
    54               0                 9                9     46.600000
    55               3                 9               12    193.850000
       skater_pk_goals skater_pk_assists skater_pk_points skater_pk_toi
    1               NA                NA               NA            NA
    2               NA                NA               NA            NA
    3               NA                NA               NA            NA
    4               NA                NA               NA            NA
    5               NA                NA               NA            NA
    6               NA                NA               NA            NA
    7               NA                NA               NA            NA
    8               NA                NA               NA            NA
    9               NA                NA               NA            NA
    10              NA                NA               NA            NA
    11              NA                NA               NA            NA
    12              NA                NA               NA            NA
    13              NA                NA               NA            NA
    14              NA                NA               NA            NA
    15              NA                NA               NA            NA
    16              NA                NA               NA            NA
    17              NA                NA               NA            NA
    18              NA                NA               NA            NA
    19              NA                NA               NA            NA
    20              NA                NA               NA            NA
    21              NA                NA               NA            NA
    22              NA                NA               NA            NA
    23              NA                NA               NA            NA
    24              NA                NA               NA            NA
    25              NA                NA               NA            NA
    26              NA                NA               NA            NA
    27              NA                NA               NA            NA
    28              NA                NA               NA            NA
    29              NA                NA               NA            NA
    30              NA                NA               NA            NA
    31              NA                NA               NA            NA
    32              NA                NA               NA            NA
    33              NA                NA               NA            NA
    34              NA                NA               NA            NA
    35               1                 0                1            NA
    36               3                 3                6            NA
    37               3                 1                4            NA
    38               0                 0                0            NA
    39               0                 0                0   38.11666667
    40               2                 1                3  239.21666667
    41               0                 0                0   13.30000000
    42               3                 0                3  156.10000000
    43               3                 0                3   91.63333333
    44               0                 0                0   93.91666667
    45               1                 0                1   38.55000000
    46               0                 0                0    2.71666667
    47               1                 1                2   88.40000000
    48               0                 0                0    0.41666667
    49               0                 0                0   51.71666667
    50               0                 0                0    0.08333333
    51               0                 0                0   30.13333333
    52               0                 0                0    3.98333333
    53               0                 0                0    6.73333333
    54               0                 0                0    2.80000000
    55               0                 0                0   50.96666667
       goalie_games goalie_started goalie_wins goalie_losses goalie_ties goalie_ot
    1            15             14           9             5           1        NA
    2             6              5           4             1          NA        NA
    3             6             NA           4             1          NA         0
    4            30             29          16            10           2        NA
    5            60             58          27            20          10        NA
    6             6              6           2             4          NA        NA
    7            68             67          29            28           9        NA
    8            11             11           7             4          NA        NA
    9            71             71          36            23          11        NA
    10            4              4           0             4          NA        NA
    11           36             36          20            10           1        NA
    12            7              7           3             3          NA        NA
    13           34             34          15            16           2        NA
    14           72             72          32            29           9        NA
    15           12             12           5             7          NA        NA
    16           71             71          29            31           9        NA
    17           12             12           5             7          NA        NA
    18           67             67          35            24           7        NA
    19           17             17           9             8          NA        NA
    20           63             63          36            20           7        NA
    21           12             12           6             6          NA        NA
    22           68             68          33            27           8        NA
    23           11             11           7             4          NA        NA
    24           51             51          29            17           5        NA
    25           20             20          10            10          NA        NA
    26           61             60          34            19           6        NA
    27            4              4           0             4          NA        NA
    28           31             30          16            10           3        NA
    29            9              8           4             4          NA        NA
    30           60             59          32            21          NA         3
    31           55             50          18            31          NA         2
    32            9              5           3             2          NA         0
    33            2              0           1             0          NA        NA
    34           21             11           5             9          NA         1
    35           NA             NA          NA            NA          NA        NA
    36           NA             NA          NA            NA          NA        NA
    37           NA             NA          NA            NA          NA        NA
    38           NA             NA          NA            NA          NA        NA
    39           NA             NA          NA            NA          NA        NA
    40           NA             NA          NA            NA          NA        NA
    41           NA             NA          NA            NA          NA        NA
    42           NA             NA          NA            NA          NA        NA
    43           NA             NA          NA            NA          NA        NA
    44           NA             NA          NA            NA          NA        NA
    45           NA             NA          NA            NA          NA        NA
    46           NA             NA          NA            NA          NA        NA
    47           NA             NA          NA            NA          NA        NA
    48           NA             NA          NA            NA          NA        NA
    49           NA             NA          NA            NA          NA        NA
    50           NA             NA          NA            NA          NA        NA
    51           NA             NA          NA            NA          NA        NA
    52           NA             NA          NA            NA          NA        NA
    53           NA             NA          NA            NA          NA        NA
    54           NA             NA          NA            NA          NA        NA
    55           NA             NA          NA            NA          NA        NA
       goalie_shutouts goalie_shotagainst goalie_goalagainst goalie_savepct
    1                0                435                 48      0.8896552
    2                0                166                 18      0.8915663
    3                0                167                 18      0.8922156
    4                0                874                 89      0.8981693
    5                2               1953                175      0.9103943
    6                0                217                 23      0.8940092
    7                1               2202                196      0.9109900
    8                2                438                 27      0.9383562
    9                1               2382                213      0.9105793
    10               0                158                 15      0.9050633
    11               1                904                 89      0.9015487
    12               0                178                 24      0.8651685
    13               0                971                111      0.8856849
    14               6               2144                200      0.9067164
    15               2                405                 36      0.9111111
    16               8               1901                181      0.9047870
    17               3                319                 23      0.9278997
    18               3               1903                171      0.9101419
    19               1                440                 41      0.9068182
    20               4               1854                158      0.9147789
    21               1                369                 25      0.9322493
    22               6               1907                163      0.9145254
    23               3                329                 24      0.9270517
    24               4               1210                114      0.9057851
    25               3                557                 48      0.9138241
    26               5               1676                148      0.9116945
    27               0                120                 10      0.9166667
    28               2                744                 68      0.9086022
    29               1                197                 12      0.9390863
    30               4               1690                166      0.9017751
    31               4               1481                159      0.8926401
    32               0                181                 17      0.9060773
    33               0                 33                  1      0.9696970
    34               0                383                 50      0.8694517
    35              NA                 NA                 NA             NA
    36              NA                 NA                 NA             NA
    37              NA                 NA                 NA             NA
    38              NA                 NA                 NA             NA
    39              NA                 NA                 NA             NA
    40              NA                 NA                 NA             NA
    41              NA                 NA                 NA             NA
    42              NA                 NA                 NA             NA
    43              NA                 NA                 NA             NA
    44              NA                 NA                 NA             NA
    45              NA                 NA                 NA             NA
    46              NA                 NA                 NA             NA
    47              NA                 NA                 NA             NA
    48              NA                 NA                 NA             NA
    49              NA                 NA                 NA             NA
    50              NA                 NA                 NA             NA
    51              NA                 NA                 NA             NA
    52              NA                 NA                 NA             NA
    53              NA                 NA                 NA             NA
    54              NA                 NA                 NA             NA
    55              NA                 NA                 NA             NA
       goalie_gaa goalie_toi goalie_ev_shotagainst goalie_ev_goalagainst
    1   3.3815385  851.68333                    35                    35
    2   3.3046050  326.81667                    11                    11
    3   3.3027523  327.00000                    NA                    NA
    4   3.1220767 1710.40000                    63                    63
    5   3.0055531 3493.53333                   126                   126
    6   3.6381212  379.31667                    13                    13
    7   3.0230067 3890.16667                   142                   142
    8   2.2670554  714.58333                    18                    18
    9   3.0969430 4126.65000                   150                   150
    10  3.6637492  245.65000                     9                     9
    11  2.7902602 1913.80000                    57                    57
    12  3.6755009  391.78333                     8                     8
    13  3.4407047 1935.65000                    74                    74
    14  2.9265794 4100.35000                   137                   137
    15  2.8148824  767.35000                    25                    25
    16  2.6280552 4132.33333                  1430                   118
    17  1.9277333  715.86667                   224                    15
    18  2.5642735 4001.13333                  1458                   118
    19  2.4341172 1010.63333                   317                    26
    20  2.4940258 3801.08333                  1424                   108
    21  2.0576132  729.00000                   287                    17
    22  2.3853271 4100.06667                  1446                   111
    23  2.1023944  684.93333                   248                    18
    24  2.2317083 3064.91667                   947                    80
    25  2.2980863 1253.21667                   420                    27
    26  2.4898709 3566.45000                  1264                   102
    27  2.0787620  288.63333                    87                    10
    28  2.3888054 1707.96667                   550                    48
    29  1.3911251  517.56667                   168                    10
    30  2.9087086 3424.20000                  1143                   100
    31  3.1871179 2993.30000                  1093                   102
    32  2.5521268  399.66667                   140                    11
    33  0.7559849   79.36667                    27                     1
    34  3.5684549  840.70000                   316                    34
    35         NA         NA                    NA                    NA
    36         NA         NA                    NA                    NA
    37         NA         NA                    NA                    NA
    38         NA         NA                    NA                    NA
    39         NA         NA                    NA                    NA
    40         NA         NA                    NA                    NA
    41         NA         NA                    NA                    NA
    42         NA         NA                    NA                    NA
    43         NA         NA                    NA                    NA
    44         NA         NA                    NA                    NA
    45         NA         NA                    NA                    NA
    46         NA         NA                    NA                    NA
    47         NA         NA                    NA                    NA
    48         NA         NA                    NA                    NA
    49         NA         NA                    NA                    NA
    50         NA         NA                    NA                    NA
    51         NA         NA                    NA                    NA
    52         NA         NA                    NA                    NA
    53         NA         NA                    NA                    NA
    54         NA         NA                    NA                    NA
    55         NA         NA                    NA                    NA
       goalie_ev_savepct goalie_pp_shotagainst goalie_pp_goalagainst
    1          0.0000000                    10                    10
    2          0.0000000                     5                     5
    3                 NA                    NA                    NA
    4          0.0000000                    20                    20
    5          0.0000000                    40                    40
    6          0.0000000                     9                     9
    7          0.0000000                    48                    48
    8          0.0000000                     9                     9
    9          0.0000000                    53                    53
    10         0.0000000                     6                     6
    11         0.0000000                    30                    30
    12         0.0000000                    10                    10
    13         0.0000000                    33                    33
    14         0.0000000                    52                    52
    15         0.0000000                    10                    10
    16         0.9174825                   446                    55
    17         0.9330357                    77                     7
    18         0.9190672                   371                    48
    19         0.9179811                   102                    13
    20         0.9241573                   357                    46
    21         0.9407666                    68                     7
    22         0.9232365                   391                    44
    23         0.9274194                    70                     6
    24         0.9155227                   230                    31
    25         0.9357143                   119                    20
    26         0.9193038                   364                    43
    27         0.8850575                    27                     0
    28         0.9127273                   167                    18
    29         0.9404762                    24                     2
    30         0.9125109                   450                    60
    31         0.9066789                   330                    48
    32         0.9214286                    34                     6
    33         0.9629630                     6                     0
    34         0.8924051                    59                    16
    35                NA                    NA                    NA
    36                NA                    NA                    NA
    37                NA                    NA                    NA
    38                NA                    NA                    NA
    39                NA                    NA                    NA
    40                NA                    NA                    NA
    41                NA                    NA                    NA
    42                NA                    NA                    NA
    43                NA                    NA                    NA
    44                NA                    NA                    NA
    45                NA                    NA                    NA
    46                NA                    NA                    NA
    47                NA                    NA                    NA
    48                NA                    NA                    NA
    49                NA                    NA                    NA
    50                NA                    NA                    NA
    51                NA                    NA                    NA
    52                NA                    NA                    NA
    53                NA                    NA                    NA
    54                NA                    NA                    NA
    55                NA                    NA                    NA
       goalie_pp_savepct goalie_pk_shotagainst goalie_pk_goalagainst
    1          0.0000000                     3                     3
    2          0.0000000                     2                     2
    3                 NA                    NA                    NA
    4          0.0000000                     6                     6
    5          0.0000000                     9                     9
    6          0.0000000                     1                     1
    7          0.0000000                     6                     6
    8          0.0000000                     0                     0
    9          0.0000000                    10                    10
    10         0.0000000                     0                     0
    11         0.0000000                     2                     2
    12         0.0000000                     6                     6
    13         0.0000000                     4                     4
    14         0.0000000                    10                    10
    15         0.0000000                     1                     1
    16         0.8766816                    67                     8
    17         0.9090909                    18                     1
    18         0.8706199                    73                     4
    19         0.8725490                    21                     2
    20         0.8711485                    73                     4
    21         0.8970588                    14                     1
    22         0.8874680                    70                     8
    23         0.9142857                    11                     0
    24         0.8652174                    33                     2
    25         0.8319328                    18                     0
    26         0.8818681                    48                     3
    27         1.0000000                     6                     0
    28         0.8922156                    27                     2
    29         0.9166667                     5                     0
    30         0.8666667                    97                     5
    31         0.8545455                    58                     7
    32         0.8235294                     7                     0
    33         1.0000000                     0                     0
    34         0.7288136                     8                     0
    35                NA                    NA                    NA
    36                NA                    NA                    NA
    37                NA                    NA                    NA
    38                NA                    NA                    NA
    39                NA                    NA                    NA
    40                NA                    NA                    NA
    41                NA                    NA                    NA
    42                NA                    NA                    NA
    43                NA                    NA                    NA
    44                NA                    NA                    NA
    45                NA                    NA                    NA
    46                NA                    NA                    NA
    47                NA                    NA                    NA
    48                NA                    NA                    NA
    49                NA                    NA                    NA
    50                NA                    NA                    NA
    51                NA                    NA                    NA
    52                NA                    NA                    NA
    53                NA                    NA                    NA
    54                NA                    NA                    NA
    55                NA                    NA                    NA
       goalie_pk_savepct
    1          0.0000000
    2          0.0000000
    3                 NA
    4          0.0000000
    5          0.0000000
    6          0.0000000
    7          0.0000000
    8                NaN
    9          0.0000000
    10               NaN
    11         0.0000000
    12         0.0000000
    13         0.0000000
    14         0.0000000
    15         0.0000000
    16         0.8805970
    17         0.9444444
    18         0.9452055
    19         0.9047619
    20         0.9452055
    21         0.9285714
    22         0.8857143
    23         1.0000000
    24         0.9393939
    25         1.0000000
    26         0.9375000
    27         1.0000000
    28         0.9259259
    29         1.0000000
    30         0.9484536
    31         0.8793103
    32         1.0000000
    33               NaN
    34         1.0000000
    35                NA
    36                NA
    37                NA
    38                NA
    39                NA
    40                NA
    41                NA
    42                NA
    43                NA
    44                NA
    45                NA
    46                NA
    47                NA
    48                NA
    49                NA
    50                NA
    51                NA
    52                NA
    53                NA
    54                NA
    55                NA

