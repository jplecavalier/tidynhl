# tidy_players_stats() gives correct data

         player_name season_years season_type team_abbreviation skater_games
    1  Ryan Callahan      2006-07     regular               NYR           14
    2  Ryan Callahan      2006-07    playoffs               NYR           10
    3  Ryan Callahan      2007-08     regular               NYR           52
    4  Ryan Callahan      2007-08    playoffs               NYR           10
    5  Ryan Callahan      2008-09     regular               NYR           81
    6  Ryan Callahan      2008-09    playoffs               NYR            7
    7  Ryan Callahan      2009-10     regular               NYR           77
    8  Ryan Callahan      2010-11     regular               NYR           60
    9  Ryan Callahan      2011-12     regular               NYR           76
    10 Ryan Callahan      2011-12    playoffs               NYR           20
    11 Ryan Callahan      2012-13     regular               NYR           45
    12 Ryan Callahan      2012-13    playoffs               NYR           12
    13 Ryan Callahan      2013-14     regular               NYR           45
    14 Ryan Callahan      2013-14     regular               TBL           20
    15 Ryan Callahan      2013-14    playoffs               TBL            4
    16 Ryan Callahan      2014-15     regular               TBL           77
    17 Ryan Callahan      2014-15    playoffs               TBL           25
    18 Ryan Callahan      2015-16     regular               TBL           73
    19 Ryan Callahan      2015-16    playoffs               TBL           16
    20 Ryan Callahan      2016-17     regular               TBL           18
    21 Ryan Callahan      2017-18     regular               TBL           67
    22 Ryan Callahan      2017-18    playoffs               TBL           15
    23 Ryan Callahan      2018-19     regular               TBL           52
    24 Ryan Callahan      2018-19    playoffs               TBL            2
       skater_goals skater_assists skater_points skater_plusminus skater_pim
    1             4              2             6                5          9
    2             2              1             3                1          6
    3             8              5            13                7         31
    4             2              2             4                3         10
    5            22             18            40                7         45
    6             2              0             2               -1          4
    7            19             18            37              -12         48
    8            23             25            48               -7         46
    9            29             25            54               -8         61
    10            6              4            10                2         12
    11           16             15            31                9         12
    12            2              3             5                2          6
    13           11             14            25               -3         16
    14            6              5            11                4          8
    15            0              0             0               -2          0
    16           24             30            54                9         41
    17            2              6             8                3         14
    18           10             18            28               -5         45
    19            2              2             4               -3         29
    20            2              2             4               -4         23
    21            5             13            18               -4         29
    22            2              1             3                1          4
    23            7             10            17                7         14
    24            0              0             0                0          4
       skater_toi skater_shifts skater_gwg skater_otg skater_shots skater_blocked
    1   147.21667           207          1          0           40              5
    2   123.11667           180          0          0           26              6
    3   643.48333           885          1          0           92             25
    4   159.16667           218          1          0           25              1
    5  1382.21667          1906          1          0          237             32
    6   138.08333           184          1          0           19              4
    7  1494.16667          1828          3          0          204             81
    8  1194.01667          1437          5          1          179             77
    9  1598.81667          1867          9          2          235             88
    10  470.78333           553          0          0           53             31
    11  967.90000          1127          4          1          144             66
    12  280.40000           327          0          0           40             23
    13  807.68333          1027          2          0          109             47
    14  404.46667           493          1          0           54             13
    15   82.78333           109          0          0            5              2
    16 1365.61667          1627          4          0          191             46
    17  422.06667           571          0          0           56             17
    18 1258.36667          1569          1          0          156             71
    19  280.65000           395          0          0           29             17
    20  254.56667           351          1          0           22             13
    21  892.51667          1239          0          0          104             40
    22  189.40000           295          1          0           15             12
    23  579.23333           845          3          0           76             25
    24   20.25000            31          0          0            4              3
       skater_hits skater_ev_goals skater_ev_assists skater_ev_points skater_ev_toi
    1           32               4                 2                6     134.68333
    2           25               1                 1                2     107.51667
    3          139               7                 5               12     573.83333
    4           31               1                 2                3     131.15000
    5          265              19                16               35    1113.83333
    6           25               1                 0                1      96.53333
    7          285              10                 6               16    1030.03333
    8          224              13                18               31     856.88333
    9          271              15                19               34    1179.30000
    10          82               4                 3                7     330.93333
    11         154               8                12               20     708.31667
    12          64               2                 3                5     211.73333
    13         132               6                11               17     666.71667
    14          57               3                 3                6     297.53333
    15          16               0                 0                0      67.48333
    16         184              14                24               38    1117.20000
    17          83               1                 5                6     362.51667
    18         164               8                16               24     963.56667
    19          63               1                 2                3     203.28333
    20          48               2                 2                4     214.68333
    21         138               3                11               14     735.61667
    22          57               2                 1                3     168.81667
    23          89               6                 9               15     520.33333
    24           9               0                 0                0      17.88333
       skater_pp_goals skater_pp_assists skater_pp_points skater_pp_toi
    1                0                 0                0     12.516667
    2                1                 0                1     15.183333
    3                0                 0                0     13.483333
    4                0                 0                0      3.850000
    5                2                 2                4    121.783333
    6                1                 0                1     21.200000
    7                9                11               20    252.450000
    8               10                 5               15    203.366667
    9               13                 4               17    281.583333
    10               2                 1                3     88.300000
    11               6                 2                8    144.283333
    12               0                 0                0     41.900000
    13               4                 3                7     81.116667
    14               3                 2                5     75.283333
    15               0                 0                0      8.216667
    16              10                 6               16    234.633333
    17               1                 1                2     58.900000
    18               2                 2                4    169.333333
    19               1                 0                1     31.316667
    20               0                 0                0      4.233333
    21               1                 1                2     59.666667
    22               0                 0                0      0.200000
    23               1                 0                1      5.900000
    24               0                 0                0      0.000000
       skater_pk_goals skater_pk_assists skater_pk_points skater_pk_toi
    1                0                 0                0    0.01666667
    2                0                 0                0    0.41666667
    3                1                 0                1   56.16666667
    4                1                 0                1   24.16666667
    5                1                 0                1  146.60000000
    6                0                 0                0   20.35000000
    7                0                 1                1  211.68333333
    8                0                 2                2  133.76666667
    9                1                 2                3  137.93333333
    10               0                 0                0   51.55000000
    11               2                 1                3  115.30000000
    12               0                 0                0   26.76666667
    13               1                 0                1   59.85000000
    14               0                 0                0   31.65000000
    15               0                 0                0    7.08333333
    16               0                 0                0   13.78333333
    17               0                 0                0    0.65000000
    18               0                 0                0  125.46666667
    19               0                 0                0   46.05000000
    20               0                 0                0   35.65000000
    21               1                 1                2   97.23333333
    22               0                 0                0   20.38333333
    23               0                 1                1   53.00000000
    24               0                 0                0    2.36666667
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

---

          player_name season_years season_type team_abbreviation skater_games
    1  Roberto Luongo      1999-00     regular               NYI           NA
    2  Roberto Luongo      2000-01     regular               FLA           NA
    3  Roberto Luongo      2001-02     regular               FLA           NA
    4  Roberto Luongo      2002-03     regular               FLA           NA
    5  Roberto Luongo      2003-04     regular               FLA           NA
    6  Roberto Luongo      2005-06     regular               FLA           NA
    7  Roberto Luongo      2006-07     regular               VAN           NA
    8  Roberto Luongo      2006-07    playoffs               VAN           NA
    9  Roberto Luongo      2007-08     regular               VAN           NA
    10 Roberto Luongo      2008-09     regular               VAN           NA
    11 Roberto Luongo      2008-09    playoffs               VAN           NA
    12 Roberto Luongo      2009-10     regular               VAN           NA
    13 Roberto Luongo      2009-10    playoffs               VAN           NA
    14 Roberto Luongo      2010-11     regular               VAN           NA
    15 Roberto Luongo      2010-11    playoffs               VAN           NA
    16 Roberto Luongo      2011-12     regular               VAN           NA
    17 Roberto Luongo      2011-12    playoffs               VAN           NA
    18 Roberto Luongo      2012-13     regular               VAN           NA
    19 Roberto Luongo      2012-13    playoffs               VAN           NA
    20 Roberto Luongo      2013-14     regular               VAN           NA
    21 Roberto Luongo      2013-14     regular               FLA           NA
    22 Roberto Luongo      2014-15     regular               FLA           NA
    23 Roberto Luongo      2015-16     regular               FLA           NA
    24 Roberto Luongo      2015-16    playoffs               FLA           NA
    25 Roberto Luongo      2016-17     regular               FLA           NA
    26 Roberto Luongo      2017-18     regular               FLA           NA
    27 Roberto Luongo      2018-19     regular               FLA           NA
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
       goalie_games goalie_started goalie_wins goalie_losses goalie_ties goalie_ot
    1            24             20           7            14           1        NA
    2            47             41          12            24           7        NA
    3            58             56          16            33           4        NA
    4            65             62          20            34           7        NA
    5            72             72          25            33          14        NA
    6            75             73          35            30          NA         9
    7            76             75          47            22          NA         6
    8            12             12           5             7          NA        NA
    9            73             73          35            29          NA         9
    10           54             54          33            13          NA         7
    11           10             10           6             4          NA        NA
    12           68             67          40            22          NA         4
    13           12             12           6             6          NA        NA
    14           60             60          38            15          NA         7
    15           25             24          15            10          NA        NA
    16           55             54          31            14          NA         8
    17            2              2           0             2          NA        NA
    18           20             18           9             6          NA         3
    19            3              2           0             2          NA        NA
    20           42             42          19            16          NA         6
    21           14             14           6             7          NA         1
    22           61             61          28            19          NA        12
    23           62             60          35            19          NA         6
    24            6              6           2             4          NA        NA
    25           40             39          17            15          NA         6
    26           35             33          18            11           0         2
    27           43             40          18            16           0         5
       goalie_shutouts goalie_shotagainst goalie_goalagainst goalie_savepct
    1                1                730                 70      0.9041096
    2                5               1333                107      0.9197299
    3                4               1653                140      0.9153055
    4                6               2011                164      0.9184485
    5                7               2475                172      0.9305051
    6                4               2488                213      0.9143891
    7                5               2169                171      0.9211618
    8                0                427                 25      0.9414520
    9                6               2029                168      0.9172006
    10               9               1542                124      0.9195850
    11               1                304                 26      0.9144737
    12               4               1915                167      0.9127937
    13               0                362                 38      0.8950276
    14               4               1753                126      0.9281232
    15               4                711                 61      0.9142053
    16               5               1577                127      0.9194673
    17               0                 64                  7      0.8906250
    18               2                551                 51      0.9074410
    19               0                 71                  6      0.9154930
    20               3               1157                 96      0.9170268
    21               1                432                 33      0.9236111
    22               2               1743                138      0.9208262
    23               4               1801                141      0.9217102
    24               0                227                 15      0.9339207
    25               1               1217                104      0.9145440
    26               3               1143                 81      0.9291339
    27               1               1205                122      0.8987552
       goalie_gaa goalie_toi goalie_ev_shotagainst goalie_ev_goalagainst
    1    3.249810  1292.3833                   524                    48
    2    2.442597  2628.3500                   999                    70
    3    2.772613  3029.6333                  1241                    89
    4    2.712637  3627.4667                  1490                   112
    5    2.427264  4251.7000                  1887                   119
    6    2.968791  4304.7833                  1720                   127
    7    2.284942  4490.2667                  1547                   112
    8    1.770051   847.4333                   307                    18
    9    2.381552  4232.5333                  1518                   108
    10   2.338826  3181.0833                  1156                    74
    11   2.524476   617.9500                   228                    16
    12   2.569626  3899.4000                  1505                   113
    13   3.225502   706.8667                   270                    19
    14   2.106055  3589.6500                  1416                    94
    15   2.564522  1427.1667                   548                    38
    16   2.409575  3162.3833                  1288                    91
    17   3.587189   117.0833                    41                     2
    18   2.556569  1196.9167                   460                    37
    19   2.577258   139.6833                    52                     5
    20   2.382101  2418.0333                   990                    78
    21   2.461768   804.3000                   331                    21
    22   2.346817  3528.1833                  1418                    96
    23   2.348793  3601.8500                  1449                    92
    24   2.053232   438.3333                   193                    10
    25   2.682064  2326.5667                  1010                    89
    26   2.472066  1965.9667                   950                    64
    27   3.119362  2346.6333                  1053                    99
       goalie_ev_savepct goalie_pp_shotagainst goalie_pp_goalagainst
    1          0.9083969                   174                    20
    2          0.9299299                   269                    29
    3          0.9282836                   358                    46
    4          0.9248322                   452                    46
    5          0.9369369                   509                    43
    6          0.9261628                   656                    77
    7          0.9276018                   543                    51
    8          0.9413681                   108                     7
    9          0.9288538                   429                    55
    10         0.9359862                   330                    47
    11         0.9298246                    69                     9
    12         0.9249169                   350                    49
    13         0.9296296                    81                    17
    14         0.9336158                   300                    31
    15         0.9306569                   137                    17
    16         0.9293478                   253                    33
    17         0.9512195                    18                     3
    18         0.9195652                    75                    13
    19         0.9038462                    19                     1
    20         0.9212121                   144                    16
    21         0.9365559                    90                    12
    22         0.9322990                   287                    39
    23         0.9365079                   309                    46
    24         0.9481865                    28                     5
    25         0.9118812                   170                    13
    26         0.9326316                   157                    16
    27         0.9059829                   110                    14
       goalie_pp_savepct goalie_pk_shotagainst goalie_pk_goalagainst
    1          0.8850575                    32                     2
    2          0.8921933                    65                     8
    3          0.8715084                    55                     5
    4          0.8982301                    69                     6
    5          0.9155206                    80                    10
    6          0.8826220                    71                     9
    7          0.9060773                    79                     7
    8          0.9351852                    12                     0
    9          0.8717949                    82                     5
    10         0.8575758                    56                     3
    11         0.8695652                     7                     1
    12         0.8600000                    60                     5
    13         0.7901235                    11                     2
    14         0.8966667                    37                     1
    15         0.8759124                    26                     6
    16         0.8695652                    36                     3
    17         0.8333333                     5                     2
    18         0.8266667                    16                     1
    19         0.9473684                     0                     0
    20         0.8888889                    23                     2
    21         0.8666667                    11                     0
    22         0.8641115                    38                     3
    23         0.8511327                    43                     3
    24         0.8214286                     6                     0
    25         0.9235294                    37                     2
    26         0.8980892                    36                     1
    27         0.8727273                    42                     9
       goalie_pk_savepct
    1          0.9375000
    2          0.8769231
    3          0.9090909
    4          0.9130435
    5          0.8750000
    6          0.8732394
    7          0.9113924
    8          1.0000000
    9          0.9390244
    10         0.9464286
    11         0.8571429
    12         0.9166667
    13         0.8181818
    14         0.9729730
    15         0.7692308
    16         0.9166667
    17         0.6000000
    18         0.9375000
    19               NaN
    20         0.9130435
    21         1.0000000
    22         0.9210526
    23         0.9302326
    24         1.0000000
    25         0.9459459
    26         0.9722222
    27         0.7857143

---

         player_name season_years season_type team_abbreviation skater_games
    1   Chris Kunitz      2003-04     regular               ANA           21
    2   Chris Kunitz      2005-06     regular               ATL            2
    3   Chris Kunitz      2005-06     regular               ANA           67
    4   Chris Kunitz      2005-06    playoffs               ANA           16
    5   Chris Kunitz      2006-07     regular               ANA           81
    6   Chris Kunitz      2006-07    playoffs               ANA           13
    7   Chris Kunitz      2007-08     regular               ANA           82
    8   Chris Kunitz      2007-08    playoffs               ANA            6
    9   Chris Kunitz      2008-09     regular               ANA           62
    10  Chris Kunitz      2008-09     regular               PIT           20
    11  Chris Kunitz      2008-09    playoffs               PIT           24
    12  Chris Kunitz      2009-10     regular               PIT           50
    13  Chris Kunitz      2009-10    playoffs               PIT           13
    14  Chris Kunitz      2010-11     regular               PIT           66
    15  Chris Kunitz      2010-11    playoffs               PIT            6
    16  Chris Kunitz      2011-12     regular               PIT           82
    17  Chris Kunitz      2011-12    playoffs               PIT            6
    18  Chris Kunitz      2012-13     regular               PIT           48
    19  Chris Kunitz      2012-13    playoffs               PIT           15
    20  Chris Kunitz      2013-14     regular               PIT           78
    21  Chris Kunitz      2013-14    playoffs               PIT           13
    22  Chris Kunitz      2014-15     regular               PIT           74
    23  Chris Kunitz      2014-15    playoffs               PIT            5
    24  Chris Kunitz      2015-16     regular               PIT           80
    25  Chris Kunitz      2015-16    playoffs               PIT           24
    26  Chris Kunitz      2016-17     regular               PIT           71
    27  Chris Kunitz      2016-17    playoffs               PIT           20
    28  Chris Kunitz      2017-18     regular               TBL           82
    29  Chris Kunitz      2017-18    playoffs               TBL           17
    30  Chris Kunitz      2018-19     regular               CHI           56
    31 Ryan Callahan      2006-07     regular               NYR           14
    32 Ryan Callahan      2006-07    playoffs               NYR           10
    33 Ryan Callahan      2007-08     regular               NYR           52
    34 Ryan Callahan      2007-08    playoffs               NYR           10
    35 Ryan Callahan      2008-09     regular               NYR           81
    36 Ryan Callahan      2008-09    playoffs               NYR            7
    37 Ryan Callahan      2009-10     regular               NYR           77
    38 Ryan Callahan      2010-11     regular               NYR           60
    39 Ryan Callahan      2011-12     regular               NYR           76
    40 Ryan Callahan      2011-12    playoffs               NYR           20
    41 Ryan Callahan      2012-13     regular               NYR           45
    42 Ryan Callahan      2012-13    playoffs               NYR           12
    43 Ryan Callahan      2013-14     regular               NYR           45
    44 Ryan Callahan      2013-14     regular               TBL           20
    45 Ryan Callahan      2013-14    playoffs               TBL            4
    46 Ryan Callahan      2014-15     regular               TBL           77
    47 Ryan Callahan      2014-15    playoffs               TBL           25
    48 Ryan Callahan      2015-16     regular               TBL           73
    49 Ryan Callahan      2015-16    playoffs               TBL           16
    50 Ryan Callahan      2016-17     regular               TBL           18
    51 Ryan Callahan      2017-18     regular               TBL           67
    52 Ryan Callahan      2017-18    playoffs               TBL           15
    53 Ryan Callahan      2018-19     regular               TBL           52
    54 Ryan Callahan      2018-19    playoffs               TBL            2
       skater_goals skater_assists skater_points skater_plusminus skater_pim
    1             0              6             6                1         12
    2             0              0             0               -3          2
    3            19             22            41               19         69
    4             3              5             8               -1          8
    5            25             35            60               23         81
    6             1              5             6                1         19
    7            21             29            50                8         80
    8             0              2             2               -2          8
    9            16             19            35                9         55
    10            7             11            18                3         16
    11            1             13            14                3         19
    12           13             19            32                3         39
    13            4              7            11                3          8
    14           23             25            48               18         47
    15            1              0             1               -1          6
    16           26             35            61               16         49
    17            2              4             6               -2          8
    18           22             30            52               30         39
    19            5              5            10               -1          6
    20           35             33            68               25         66
    21            3              5             8               -4         16
    22           17             23            40                2         56
    23            1              2             3                2          8
    24           17             23            40               29         41
    25            4              8            12                2         15
    26            9             20            29                0         36
    27            2              9            11                6         27
    28           13             16            29                8         35
    29            0              1             1               -1         16
    30            5              5            10               -7         23
    31            4              2             6                5          9
    32            2              1             3                1          6
    33            8              5            13                7         31
    34            2              2             4                3         10
    35           22             18            40                7         45
    36            2              0             2               -1          4
    37           19             18            37              -12         48
    38           23             25            48               -7         46
    39           29             25            54               -8         61
    40            6              4            10                2         12
    41           16             15            31                9         12
    42            2              3             5                2          6
    43           11             14            25               -3         16
    44            6              5            11                4          8
    45            0              0             0               -2          0
    46           24             30            54                9         41
    47            2              6             8                3         14
    48           10             18            28               -5         45
    49            2              2             4               -3         29
    50            2              2             4               -4         23
    51            5             13            18               -4         29
    52            2              1             3                1          4
    53            7             10            17                7         14
    54            0              0             0                0          4
       skater_toi skater_shifts skater_gwg skater_otg skater_shots skater_blocked
    1   191.46667           308          0          0           31              0
    2    11.41667            19          0          0            0              1
    3   947.20000          1368          2          0          149             21
    4   200.05000           324          0          0           34              8
    5  1381.15000          1787          5          0          180             15
    6   231.23333           344          0          0           28              1
    7  1386.18333          1818          6          0          196             19
    8   111.03333           138          0          0           14              1
    9  1022.11667          1323          2          0          139             15
    10  325.56667           385          1          0           39             10
    11  405.80000           523          0          0           46             14
    12  821.73333           973          0          0          131             15
    13  226.58333           287          0          0           38              2
    14 1206.46667          1360          2          0          133             14
    15  104.28333           127          0          0           13              1
    16 1501.80000          1712          3          0          230             28
    17  114.31667           129          0          0           17              7
    18  865.06667           978          5          0          113             13
    19  274.68333           341          1          1           32              6
    20 1494.26667          1728          8          0          218             25
    21  247.21667           323          0          0           40              4
    22 1323.78333          1722          5          0          170             29
    23   90.95000           123          1          0            6              1
    24 1345.96667          1880          1          0          150             33
    25  343.96667           528          0          0           50              8
    26 1101.46667          1511          3          0          134             28
    27  297.31667           453          1          1           28              8
    28  979.60000          1383          2          0           81             30
    29  177.95000           289          0          0           16              6
    30  507.30000           747          1          0           44             15
    31  147.21667           207          1          0           40              5
    32  123.11667           180          0          0           26              6
    33  643.48333           885          1          0           92             25
    34  159.16667           218          1          0           25              1
    35 1382.21667          1906          1          0          237             32
    36  138.08333           184          1          0           19              4
    37 1494.16667          1828          3          0          204             81
    38 1194.01667          1437          5          1          179             77
    39 1598.81667          1867          9          2          235             88
    40  470.78333           553          0          0           53             31
    41  967.90000          1127          4          1          144             66
    42  280.40000           327          0          0           40             23
    43  807.68333          1027          2          0          109             47
    44  404.46667           493          1          0           54             13
    45   82.78333           109          0          0            5              2
    46 1365.61667          1627          4          0          191             46
    47  422.06667           571          0          0           56             17
    48 1258.36667          1569          1          0          156             71
    49  280.65000           395          0          0           29             17
    50  254.56667           351          1          0           22             13
    51  892.51667          1239          0          0          104             40
    52  189.40000           295          1          0           15             12
    53  579.23333           845          3          0           76             25
    54   20.25000            31          0          0            4              3
       skater_hits skater_ev_goals skater_ev_assists skater_ev_points skater_ev_toi
    1           15               0                 6                6     166.20000
    2            1               0                 0                0       9.30000
    3           86              13                17               30     739.81667
    4           23               3                 5                8     158.01667
    5          159              14                26               40    1027.48333
    6           27               1                 3                4     177.33333
    7          159              13                22               35    1045.51667
    8           29               0                 1                1      80.13333
    9          148              13                17               30     876.65000
    10          59               4                 6               10     226.18333
    11          80               1                11               12     341.58333
    12         112              10                14               24     695.58333
    13          50               3                 7               10     197.73333
    14         155              15                20               35     895.83333
    15          11               1                 0                1      77.16667
    16         180              20                23               43    1201.68333
    17          23               0                 4                4      84.03333
    18         104              13                23               36     674.71667
    19          42               2                 5                7     216.78333
    20         157              22                24               46    1197.11667
    21          40               1                 5                6     196.38333
    22         211               7                16               23    1084.58333
    23          23               0                 1                1      79.06667
    24         264              15                19               34    1147.50000
    25          89               2                 6                8     307.40000
    26         216               9                15               24     937.78333
    27          61               2                 8               10     268.15000
    28         131              12                15               27     906.81667
    29          32               0                 1                1     177.61667
    30          85               5                 5               10     492.78333
    31          32               4                 2                6     134.68333
    32          25               1                 1                2     107.51667
    33         139               7                 5               12     573.83333
    34          31               1                 2                3     131.15000
    35         265              19                16               35    1113.83333
    36          25               1                 0                1      96.53333
    37         285              10                 6               16    1030.03333
    38         224              13                18               31     856.88333
    39         271              15                19               34    1179.30000
    40          82               4                 3                7     330.93333
    41         154               8                12               20     708.31667
    42          64               2                 3                5     211.73333
    43         132               6                11               17     666.71667
    44          57               3                 3                6     297.53333
    45          16               0                 0                0      67.48333
    46         184              14                24               38    1117.20000
    47          83               1                 5                6     362.51667
    48         164               8                16               24     963.56667
    49          63               1                 2                3     203.28333
    50          48               2                 2                4     214.68333
    51         138               3                11               14     735.61667
    52          57               2                 1                3     168.81667
    53          89               6                 9               15     520.33333
    54           9               0                 0                0      17.88333
       skater_pp_goals skater_pp_assists skater_pp_points skater_pp_toi
    1                0                 0                0     24.916667
    2                0                 0                0      1.366667
    3                5                 5               10    141.916667
    4                0                 0                0     35.833333
    5               11                 9               20    327.333333
    6                0                 2                2     45.933333
    7                7                 6               13    255.533333
    8                0                 1                1     17.950000
    9                3                 1                4    102.516667
    10               3                 5                8     82.483333
    11               0                 2                2     61.566667
    12               2                 5                7    115.850000
    13               1                 0                1     28.050000
    14               7                 4               11    276.016667
    15               0                 0                0     24.000000
    16               6                12               18    288.916667
    17               2                 0                2     29.466667
    18               9                 7               16    183.600000
    19               3                 0                3     56.500000
    20              13                 9               22    283.200000
    21               2                 0                2     47.383333
    22               9                 7               16    228.700000
    23               1                 1                2     11.683333
    24               2                 4                6    171.016667
    25               2                 2                4     35.683333
    26               0                 5                5    111.883333
    27               0                 1                1     13.516667
    28               0                 1                1     19.466667
    29               0                 0                0      0.200000
    30               0                 0                0     11.366667
    31               0                 0                0     12.516667
    32               1                 0                1     15.183333
    33               0                 0                0     13.483333
    34               0                 0                0      3.850000
    35               2                 2                4    121.783333
    36               1                 0                1     21.200000
    37               9                11               20    252.450000
    38              10                 5               15    203.366667
    39              13                 4               17    281.583333
    40               2                 1                3     88.300000
    41               6                 2                8    144.283333
    42               0                 0                0     41.900000
    43               4                 3                7     81.116667
    44               3                 2                5     75.283333
    45               0                 0                0      8.216667
    46              10                 6               16    234.633333
    47               1                 1                2     58.900000
    48               2                 2                4    169.333333
    49               1                 0                1     31.316667
    50               0                 0                0      4.233333
    51               1                 1                2     59.666667
    52               0                 0                0      0.200000
    53               1                 0                1      5.900000
    54               0                 0                0      0.000000
       skater_pk_goals skater_pk_assists skater_pk_points skater_pk_toi
    1                0                 0                0    0.35000000
    2                0                 0                0    0.75000000
    3                1                 0                1   65.46666667
    4                0                 0                0    6.20000000
    5                0                 0                0   26.33333333
    6                0                 0                0    7.96666667
    7                1                 1                2   85.13333333
    8                0                 0                0   12.95000000
    9                0                 1                1   42.95000000
    10               0                 0                0   16.90000000
    11               0                 0                0    2.65000000
    12               1                 0                1   10.30000000
    13               0                 0                0    0.80000000
    14               1                 1                2   34.61666667
    15               0                 0                0    3.11666667
    16               0                 0                0   11.20000000
    17               0                 0                0    0.81666667
    18               0                 0                0    6.75000000
    19               0                 0                0    1.40000000
    20               0                 0                0   13.95000000
    21               0                 0                0    3.45000000
    22               1                 0                1   10.50000000
    23               0                 0                0    0.20000000
    24               0                 0                0   27.45000000
    25               0                 0                0    0.88333333
    26               0                 0                0   51.80000000
    27               0                 0                0   15.65000000
    28               1                 0                1   53.31666667
    29               0                 0                0    0.13333333
    30               0                 0                0    3.15000000
    31               0                 0                0    0.01666667
    32               0                 0                0    0.41666667
    33               1                 0                1   56.16666667
    34               1                 0                1   24.16666667
    35               1                 0                1  146.60000000
    36               0                 0                0   20.35000000
    37               0                 1                1  211.68333333
    38               0                 2                2  133.76666667
    39               1                 2                3  137.93333333
    40               0                 0                0   51.55000000
    41               2                 1                3  115.30000000
    42               0                 0                0   26.76666667
    43               1                 0                1   59.85000000
    44               0                 0                0   31.65000000
    45               0                 0                0    7.08333333
    46               0                 0                0   13.78333333
    47               0                 0                0    0.65000000
    48               0                 0                0  125.46666667
    49               0                 0                0   46.05000000
    50               0                 0                0   35.65000000
    51               1                 1                2   97.23333333
    52               0                 0                0   20.38333333
    53               0                 1                1   53.00000000
    54               0                 0                0    2.36666667
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

---

          player_name season_years season_type team_abbreviation skater_games
    1  Roberto Luongo      1999-00     regular               NYI           NA
    2  Roberto Luongo      2000-01     regular               FLA           NA
    3  Roberto Luongo      2001-02     regular               FLA           NA
    4  Roberto Luongo      2002-03     regular               FLA           NA
    5  Roberto Luongo      2003-04     regular               FLA           NA
    6  Roberto Luongo      2005-06     regular               FLA           NA
    7  Roberto Luongo      2006-07     regular               VAN           NA
    8  Roberto Luongo      2006-07    playoffs               VAN           NA
    9  Roberto Luongo      2007-08     regular               VAN           NA
    10 Roberto Luongo      2008-09     regular               VAN           NA
    11 Roberto Luongo      2008-09    playoffs               VAN           NA
    12 Roberto Luongo      2009-10     regular               VAN           NA
    13 Roberto Luongo      2009-10    playoffs               VAN           NA
    14 Roberto Luongo      2010-11     regular               VAN           NA
    15 Roberto Luongo      2010-11    playoffs               VAN           NA
    16 Roberto Luongo      2011-12     regular               VAN           NA
    17 Roberto Luongo      2011-12    playoffs               VAN           NA
    18 Roberto Luongo      2012-13     regular               VAN           NA
    19 Roberto Luongo      2012-13    playoffs               VAN           NA
    20 Roberto Luongo      2013-14     regular               VAN           NA
    21 Roberto Luongo      2013-14     regular               FLA           NA
    22 Roberto Luongo      2014-15     regular               FLA           NA
    23 Roberto Luongo      2015-16     regular               FLA           NA
    24 Roberto Luongo      2015-16    playoffs               FLA           NA
    25 Roberto Luongo      2016-17     regular               FLA           NA
    26 Roberto Luongo      2017-18     regular               FLA           NA
    27 Roberto Luongo      2018-19     regular               FLA           NA
    28 Ondrej Pavelec      2007-08     regular               ATL           NA
    29 Ondrej Pavelec      2008-09     regular               ATL           NA
    30 Ondrej Pavelec      2009-10     regular               ATL           NA
    31 Ondrej Pavelec      2010-11     regular               ATL           NA
    32 Ondrej Pavelec      2011-12     regular               WPG           NA
    33 Ondrej Pavelec      2012-13     regular               WPG           NA
    34 Ondrej Pavelec      2013-14     regular               WPG           NA
    35 Ondrej Pavelec      2014-15     regular               WPG           NA
    36 Ondrej Pavelec      2014-15    playoffs               WPG           NA
    37 Ondrej Pavelec      2015-16     regular               WPG           NA
    38 Ondrej Pavelec      2016-17     regular               WPG           NA
    39 Ondrej Pavelec      2017-18     regular               NYR           NA
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
       goalie_games goalie_started goalie_wins goalie_losses goalie_ties goalie_ot
    1            24             20           7            14           1        NA
    2            47             41          12            24           7        NA
    3            58             56          16            33           4        NA
    4            65             62          20            34           7        NA
    5            72             72          25            33          14        NA
    6            75             73          35            30          NA         9
    7            76             75          47            22          NA         6
    8            12             12           5             7          NA        NA
    9            73             73          35            29          NA         9
    10           54             54          33            13          NA         7
    11           10             10           6             4          NA        NA
    12           68             67          40            22          NA         4
    13           12             12           6             6          NA        NA
    14           60             60          38            15          NA         7
    15           25             24          15            10          NA        NA
    16           55             54          31            14          NA         8
    17            2              2           0             2          NA        NA
    18           20             18           9             6          NA         3
    19            3              2           0             2          NA        NA
    20           42             42          19            16          NA         6
    21           14             14           6             7          NA         1
    22           61             61          28            19          NA        12
    23           62             60          35            19          NA         6
    24            6              6           2             4          NA        NA
    25           40             39          17            15          NA         6
    26           35             33          18            11           0         2
    27           43             40          18            16           0         5
    28            7              5           3             3          NA         0
    29           12             11           3             7          NA         0
    30           42             40          14            18          NA         7
    31           58             54          21            23          NA         9
    32           68             67          29            28          NA         9
    33           44             43          21            20          NA         3
    34           57             57          22            26          NA         7
    35           50             46          22            16          NA         8
    36            4              4           0             4          NA        NA
    37           33             31          13            13          NA         4
    38            8              8           4             4          NA         0
    39           19             12           4             9           0         1
       goalie_shutouts goalie_shotagainst goalie_goalagainst goalie_savepct
    1                1                730                 70      0.9041096
    2                5               1333                107      0.9197299
    3                4               1653                140      0.9153055
    4                6               2011                164      0.9184485
    5                7               2475                172      0.9305051
    6                4               2488                213      0.9143891
    7                5               2169                171      0.9211618
    8                0                427                 25      0.9414520
    9                6               2029                168      0.9172006
    10               9               1542                124      0.9195850
    11               1                304                 26      0.9144737
    12               4               1915                167      0.9127937
    13               0                362                 38      0.8950276
    14               4               1753                126      0.9281232
    15               4                711                 61      0.9142053
    16               5               1577                127      0.9194673
    17               0                 64                  7      0.8906250
    18               2                551                 51      0.9074410
    19               0                 71                  6      0.9154930
    20               3               1157                 96      0.9170268
    21               1                432                 33      0.9236111
    22               2               1743                138      0.9208262
    23               4               1801                141      0.9217102
    24               0                227                 15      0.9339207
    25               1               1217                104      0.9145440
    26               3               1143                 81      0.9291339
    27               1               1205                122      0.8987552
    28               0                190                 18      0.9052632
    29               0                301                 36      0.8803987
    30               2               1353                127      0.9061345
    31               4               1705                147      0.9137830
    32               4               2036                191      0.9061886
    33               0               1251                119      0.9048761
    34               1               1644                163      0.9008516
    35               5               1353                108      0.9201774
    36               0                137                 15      0.8905109
    37               1                918                 88      0.9041394
    38               0                233                 26      0.8884120
    39               1                510                 46      0.9098039
       goalie_gaa goalie_toi goalie_ev_shotagainst goalie_ev_goalagainst
    1    3.249810  1292.3833                   524                    48
    2    2.442597  2628.3500                   999                    70
    3    2.772613  3029.6333                  1241                    89
    4    2.712637  3627.4667                  1490                   112
    5    2.427264  4251.7000                  1887                   119
    6    2.968791  4304.7833                  1720                   127
    7    2.284942  4490.2667                  1547                   112
    8    1.770051   847.4333                   307                    18
    9    2.381552  4232.5333                  1518                   108
    10   2.338826  3181.0833                  1156                    74
    11   2.524476   617.9500                   228                    16
    12   2.569626  3899.4000                  1505                   113
    13   3.225502   706.8667                   270                    19
    14   2.106055  3589.6500                  1416                    94
    15   2.564522  1427.1667                   548                    38
    16   2.409575  3162.3833                  1288                    91
    17   3.587189   117.0833                    41                     2
    18   2.556569  1196.9167                   460                    37
    19   2.577258   139.6833                    52                     5
    20   2.382101  2418.0333                   990                    78
    21   2.461768   804.3000                   331                    21
    22   2.346817  3528.1833                  1418                    96
    23   2.348793  3601.8500                  1449                    92
    24   2.053232   438.3333                   193                    10
    25   2.682064  2326.5667                  1010                    89
    26   2.472066  1965.9667                   950                    64
    27   3.119362  2346.6333                  1053                    99
    28   3.110002   347.2667                   149                    10
    29   3.603503   599.4167                   246                    25
    30   3.288546  2317.1333                  1064                    98
    31   2.734700  3225.2167                  1394                   101
    32   2.914226  3932.4333                  1644                   136
    33   2.797020  2552.7167                  1066                    92
    34   3.011115  3247.9667                  1338                   123
    35   2.283419  2837.8500                  1048                    77
    36   3.735473   240.9333                   114                    12
    37   2.780386  1899.0167                   722                    61
    38   3.549488   439.5000                   190                    18
    39   3.054111   903.7000                   428                    34
       goalie_ev_savepct goalie_pp_shotagainst goalie_pp_goalagainst
    1          0.9083969                   174                    20
    2          0.9299299                   269                    29
    3          0.9282836                   358                    46
    4          0.9248322                   452                    46
    5          0.9369369                   509                    43
    6          0.9261628                   656                    77
    7          0.9276018                   543                    51
    8          0.9413681                   108                     7
    9          0.9288538                   429                    55
    10         0.9359862                   330                    47
    11         0.9298246                    69                     9
    12         0.9249169                   350                    49
    13         0.9296296                    81                    17
    14         0.9336158                   300                    31
    15         0.9306569                   137                    17
    16         0.9293478                   253                    33
    17         0.9512195                    18                     3
    18         0.9195652                    75                    13
    19         0.9038462                    19                     1
    20         0.9212121                   144                    16
    21         0.9365559                    90                    12
    22         0.9322990                   287                    39
    23         0.9365079                   309                    46
    24         0.9481865                    28                     5
    25         0.9118812                   170                    13
    26         0.9326316                   157                    16
    27         0.9059829                   110                    14
    28         0.9328859                    31                     8
    29         0.8983740                    51                    11
    30         0.9078947                   255                    26
    31         0.9275466                   263                    39
    32         0.9172749                   348                    48
    33         0.9136961                   160                    25
    34         0.9080717                   274                    36
    35         0.9265267                   264                    31
    36         0.8947368                    18                     3
    37         0.9155125                   171                    25
    38         0.9052632                    33                     6
    39         0.9205607                    71                     9
       goalie_pp_savepct goalie_pk_shotagainst goalie_pk_goalagainst
    1          0.8850575                    32                     2
    2          0.8921933                    65                     8
    3          0.8715084                    55                     5
    4          0.8982301                    69                     6
    5          0.9155206                    80                    10
    6          0.8826220                    71                     9
    7          0.9060773                    79                     7
    8          0.9351852                    12                     0
    9          0.8717949                    82                     5
    10         0.8575758                    56                     3
    11         0.8695652                     7                     1
    12         0.8600000                    60                     5
    13         0.7901235                    11                     2
    14         0.8966667                    37                     1
    15         0.8759124                    26                     6
    16         0.8695652                    36                     3
    17         0.8333333                     5                     2
    18         0.8266667                    16                     1
    19         0.9473684                     0                     0
    20         0.8888889                    23                     2
    21         0.8666667                    11                     0
    22         0.8641115                    38                     3
    23         0.8511327                    43                     3
    24         0.8214286                     6                     0
    25         0.9235294                    37                     2
    26         0.8980892                    36                     1
    27         0.8727273                    42                     9
    28         0.7419355                    10                     0
    29         0.7843137                     4                     0
    30         0.8980392                    34                     3
    31         0.8517110                    48                     7
    32         0.8620690                    44                     7
    33         0.8437500                    25                     2
    34         0.8686131                    32                     4
    35         0.8825758                    41                     0
    36         0.8333333                     5                     0
    37         0.8538012                    25                     2
    38         0.8181818                    10                     2
    39         0.8732394                    11                     3
       goalie_pk_savepct
    1          0.9375000
    2          0.8769231
    3          0.9090909
    4          0.9130435
    5          0.8750000
    6          0.8732394
    7          0.9113924
    8          1.0000000
    9          0.9390244
    10         0.9464286
    11         0.8571429
    12         0.9166667
    13         0.8181818
    14         0.9729730
    15         0.7692308
    16         0.9166667
    17         0.6000000
    18         0.9375000
    19               NaN
    20         0.9130435
    21         1.0000000
    22         0.9210526
    23         0.9302326
    24         1.0000000
    25         0.9459459
    26         0.9722222
    27         0.7857143
    28         1.0000000
    29         1.0000000
    30         0.9117647
    31         0.8541667
    32         0.8409091
    33         0.9200000
    34         0.8750000
    35         1.0000000
    36         1.0000000
    37         0.9200000
    38         0.8000000
    39         0.7272727

---

          player_name season_years season_type team_abbreviation skater_games
    1  Roberto Luongo      1999-00     regular               NYI           NA
    2  Roberto Luongo      2000-01     regular               FLA           NA
    3  Roberto Luongo      2001-02     regular               FLA           NA
    4  Roberto Luongo      2002-03     regular               FLA           NA
    5  Roberto Luongo      2003-04     regular               FLA           NA
    6  Roberto Luongo      2005-06     regular               FLA           NA
    7  Roberto Luongo      2006-07     regular               VAN           NA
    8  Roberto Luongo      2006-07    playoffs               VAN           NA
    9  Roberto Luongo      2007-08     regular               VAN           NA
    10 Roberto Luongo      2008-09     regular               VAN           NA
    11 Roberto Luongo      2008-09    playoffs               VAN           NA
    12 Roberto Luongo      2009-10     regular               VAN           NA
    13 Roberto Luongo      2009-10    playoffs               VAN           NA
    14 Roberto Luongo      2010-11     regular               VAN           NA
    15 Roberto Luongo      2010-11    playoffs               VAN           NA
    16 Roberto Luongo      2011-12     regular               VAN           NA
    17 Roberto Luongo      2011-12    playoffs               VAN           NA
    18 Roberto Luongo      2012-13     regular               VAN           NA
    19 Roberto Luongo      2012-13    playoffs               VAN           NA
    20 Roberto Luongo      2013-14     regular               VAN           NA
    21 Roberto Luongo      2013-14     regular               FLA           NA
    22 Roberto Luongo      2014-15     regular               FLA           NA
    23 Roberto Luongo      2015-16     regular               FLA           NA
    24 Roberto Luongo      2015-16    playoffs               FLA           NA
    25 Roberto Luongo      2016-17     regular               FLA           NA
    26 Roberto Luongo      2017-18     regular               FLA           NA
    27 Roberto Luongo      2018-19     regular               FLA           NA
    28  Ryan Callahan      2006-07     regular               NYR           14
    29  Ryan Callahan      2006-07    playoffs               NYR           10
    30  Ryan Callahan      2007-08     regular               NYR           52
    31  Ryan Callahan      2007-08    playoffs               NYR           10
    32  Ryan Callahan      2008-09     regular               NYR           81
    33  Ryan Callahan      2008-09    playoffs               NYR            7
    34  Ryan Callahan      2009-10     regular               NYR           77
    35  Ryan Callahan      2010-11     regular               NYR           60
    36  Ryan Callahan      2011-12     regular               NYR           76
    37  Ryan Callahan      2011-12    playoffs               NYR           20
    38  Ryan Callahan      2012-13     regular               NYR           45
    39  Ryan Callahan      2012-13    playoffs               NYR           12
    40  Ryan Callahan      2013-14     regular               NYR           45
    41  Ryan Callahan      2013-14     regular               TBL           20
    42  Ryan Callahan      2013-14    playoffs               TBL            4
    43  Ryan Callahan      2014-15     regular               TBL           77
    44  Ryan Callahan      2014-15    playoffs               TBL           25
    45  Ryan Callahan      2015-16     regular               TBL           73
    46  Ryan Callahan      2015-16    playoffs               TBL           16
    47  Ryan Callahan      2016-17     regular               TBL           18
    48  Ryan Callahan      2017-18     regular               TBL           67
    49  Ryan Callahan      2017-18    playoffs               TBL           15
    50  Ryan Callahan      2018-19     regular               TBL           52
    51  Ryan Callahan      2018-19    playoffs               TBL            2
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
    28            4              2             6                5          9
    29            2              1             3                1          6
    30            8              5            13                7         31
    31            2              2             4                3         10
    32           22             18            40                7         45
    33            2              0             2               -1          4
    34           19             18            37              -12         48
    35           23             25            48               -7         46
    36           29             25            54               -8         61
    37            6              4            10                2         12
    38           16             15            31                9         12
    39            2              3             5                2          6
    40           11             14            25               -3         16
    41            6              5            11                4          8
    42            0              0             0               -2          0
    43           24             30            54                9         41
    44            2              6             8                3         14
    45           10             18            28               -5         45
    46            2              2             4               -3         29
    47            2              2             4               -4         23
    48            5             13            18               -4         29
    49            2              1             3                1          4
    50            7             10            17                7         14
    51            0              0             0                0          4
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
    28  147.21667           207          1          0           40              5
    29  123.11667           180          0          0           26              6
    30  643.48333           885          1          0           92             25
    31  159.16667           218          1          0           25              1
    32 1382.21667          1906          1          0          237             32
    33  138.08333           184          1          0           19              4
    34 1494.16667          1828          3          0          204             81
    35 1194.01667          1437          5          1          179             77
    36 1598.81667          1867          9          2          235             88
    37  470.78333           553          0          0           53             31
    38  967.90000          1127          4          1          144             66
    39  280.40000           327          0          0           40             23
    40  807.68333          1027          2          0          109             47
    41  404.46667           493          1          0           54             13
    42   82.78333           109          0          0            5              2
    43 1365.61667          1627          4          0          191             46
    44  422.06667           571          0          0           56             17
    45 1258.36667          1569          1          0          156             71
    46  280.65000           395          0          0           29             17
    47  254.56667           351          1          0           22             13
    48  892.51667          1239          0          0          104             40
    49  189.40000           295          1          0           15             12
    50  579.23333           845          3          0           76             25
    51   20.25000            31          0          0            4              3
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
    28          32               4                 2                6     134.68333
    29          25               1                 1                2     107.51667
    30         139               7                 5               12     573.83333
    31          31               1                 2                3     131.15000
    32         265              19                16               35    1113.83333
    33          25               1                 0                1      96.53333
    34         285              10                 6               16    1030.03333
    35         224              13                18               31     856.88333
    36         271              15                19               34    1179.30000
    37          82               4                 3                7     330.93333
    38         154               8                12               20     708.31667
    39          64               2                 3                5     211.73333
    40         132               6                11               17     666.71667
    41          57               3                 3                6     297.53333
    42          16               0                 0                0      67.48333
    43         184              14                24               38    1117.20000
    44          83               1                 5                6     362.51667
    45         164               8                16               24     963.56667
    46          63               1                 2                3     203.28333
    47          48               2                 2                4     214.68333
    48         138               3                11               14     735.61667
    49          57               2                 1                3     168.81667
    50          89               6                 9               15     520.33333
    51           9               0                 0                0      17.88333
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
    28               0                 0                0     12.516667
    29               1                 0                1     15.183333
    30               0                 0                0     13.483333
    31               0                 0                0      3.850000
    32               2                 2                4    121.783333
    33               1                 0                1     21.200000
    34               9                11               20    252.450000
    35              10                 5               15    203.366667
    36              13                 4               17    281.583333
    37               2                 1                3     88.300000
    38               6                 2                8    144.283333
    39               0                 0                0     41.900000
    40               4                 3                7     81.116667
    41               3                 2                5     75.283333
    42               0                 0                0      8.216667
    43              10                 6               16    234.633333
    44               1                 1                2     58.900000
    45               2                 2                4    169.333333
    46               1                 0                1     31.316667
    47               0                 0                0      4.233333
    48               1                 1                2     59.666667
    49               0                 0                0      0.200000
    50               1                 0                1      5.900000
    51               0                 0                0      0.000000
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
    28               0                 0                0    0.01666667
    29               0                 0                0    0.41666667
    30               1                 0                1   56.16666667
    31               1                 0                1   24.16666667
    32               1                 0                1  146.60000000
    33               0                 0                0   20.35000000
    34               0                 1                1  211.68333333
    35               0                 2                2  133.76666667
    36               1                 2                3  137.93333333
    37               0                 0                0   51.55000000
    38               2                 1                3  115.30000000
    39               0                 0                0   26.76666667
    40               1                 0                1   59.85000000
    41               0                 0                0   31.65000000
    42               0                 0                0    7.08333333
    43               0                 0                0   13.78333333
    44               0                 0                0    0.65000000
    45               0                 0                0  125.46666667
    46               0                 0                0   46.05000000
    47               0                 0                0   35.65000000
    48               1                 1                2   97.23333333
    49               0                 0                0   20.38333333
    50               0                 1                1   53.00000000
    51               0                 0                0    2.36666667
       goalie_games goalie_started goalie_wins goalie_losses goalie_ties goalie_ot
    1            24             20           7            14           1        NA
    2            47             41          12            24           7        NA
    3            58             56          16            33           4        NA
    4            65             62          20            34           7        NA
    5            72             72          25            33          14        NA
    6            75             73          35            30          NA         9
    7            76             75          47            22          NA         6
    8            12             12           5             7          NA        NA
    9            73             73          35            29          NA         9
    10           54             54          33            13          NA         7
    11           10             10           6             4          NA        NA
    12           68             67          40            22          NA         4
    13           12             12           6             6          NA        NA
    14           60             60          38            15          NA         7
    15           25             24          15            10          NA        NA
    16           55             54          31            14          NA         8
    17            2              2           0             2          NA        NA
    18           20             18           9             6          NA         3
    19            3              2           0             2          NA        NA
    20           42             42          19            16          NA         6
    21           14             14           6             7          NA         1
    22           61             61          28            19          NA        12
    23           62             60          35            19          NA         6
    24            6              6           2             4          NA        NA
    25           40             39          17            15          NA         6
    26           35             33          18            11           0         2
    27           43             40          18            16           0         5
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
       goalie_shutouts goalie_shotagainst goalie_goalagainst goalie_savepct
    1                1                730                 70      0.9041096
    2                5               1333                107      0.9197299
    3                4               1653                140      0.9153055
    4                6               2011                164      0.9184485
    5                7               2475                172      0.9305051
    6                4               2488                213      0.9143891
    7                5               2169                171      0.9211618
    8                0                427                 25      0.9414520
    9                6               2029                168      0.9172006
    10               9               1542                124      0.9195850
    11               1                304                 26      0.9144737
    12               4               1915                167      0.9127937
    13               0                362                 38      0.8950276
    14               4               1753                126      0.9281232
    15               4                711                 61      0.9142053
    16               5               1577                127      0.9194673
    17               0                 64                  7      0.8906250
    18               2                551                 51      0.9074410
    19               0                 71                  6      0.9154930
    20               3               1157                 96      0.9170268
    21               1                432                 33      0.9236111
    22               2               1743                138      0.9208262
    23               4               1801                141      0.9217102
    24               0                227                 15      0.9339207
    25               1               1217                104      0.9145440
    26               3               1143                 81      0.9291339
    27               1               1205                122      0.8987552
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
       goalie_gaa goalie_toi goalie_ev_shotagainst goalie_ev_goalagainst
    1    3.249810  1292.3833                   524                    48
    2    2.442597  2628.3500                   999                    70
    3    2.772613  3029.6333                  1241                    89
    4    2.712637  3627.4667                  1490                   112
    5    2.427264  4251.7000                  1887                   119
    6    2.968791  4304.7833                  1720                   127
    7    2.284942  4490.2667                  1547                   112
    8    1.770051   847.4333                   307                    18
    9    2.381552  4232.5333                  1518                   108
    10   2.338826  3181.0833                  1156                    74
    11   2.524476   617.9500                   228                    16
    12   2.569626  3899.4000                  1505                   113
    13   3.225502   706.8667                   270                    19
    14   2.106055  3589.6500                  1416                    94
    15   2.564522  1427.1667                   548                    38
    16   2.409575  3162.3833                  1288                    91
    17   3.587189   117.0833                    41                     2
    18   2.556569  1196.9167                   460                    37
    19   2.577258   139.6833                    52                     5
    20   2.382101  2418.0333                   990                    78
    21   2.461768   804.3000                   331                    21
    22   2.346817  3528.1833                  1418                    96
    23   2.348793  3601.8500                  1449                    92
    24   2.053232   438.3333                   193                    10
    25   2.682064  2326.5667                  1010                    89
    26   2.472066  1965.9667                   950                    64
    27   3.119362  2346.6333                  1053                    99
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
       goalie_ev_savepct goalie_pp_shotagainst goalie_pp_goalagainst
    1          0.9083969                   174                    20
    2          0.9299299                   269                    29
    3          0.9282836                   358                    46
    4          0.9248322                   452                    46
    5          0.9369369                   509                    43
    6          0.9261628                   656                    77
    7          0.9276018                   543                    51
    8          0.9413681                   108                     7
    9          0.9288538                   429                    55
    10         0.9359862                   330                    47
    11         0.9298246                    69                     9
    12         0.9249169                   350                    49
    13         0.9296296                    81                    17
    14         0.9336158                   300                    31
    15         0.9306569                   137                    17
    16         0.9293478                   253                    33
    17         0.9512195                    18                     3
    18         0.9195652                    75                    13
    19         0.9038462                    19                     1
    20         0.9212121                   144                    16
    21         0.9365559                    90                    12
    22         0.9322990                   287                    39
    23         0.9365079                   309                    46
    24         0.9481865                    28                     5
    25         0.9118812                   170                    13
    26         0.9326316                   157                    16
    27         0.9059829                   110                    14
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
       goalie_pp_savepct goalie_pk_shotagainst goalie_pk_goalagainst
    1          0.8850575                    32                     2
    2          0.8921933                    65                     8
    3          0.8715084                    55                     5
    4          0.8982301                    69                     6
    5          0.9155206                    80                    10
    6          0.8826220                    71                     9
    7          0.9060773                    79                     7
    8          0.9351852                    12                     0
    9          0.8717949                    82                     5
    10         0.8575758                    56                     3
    11         0.8695652                     7                     1
    12         0.8600000                    60                     5
    13         0.7901235                    11                     2
    14         0.8966667                    37                     1
    15         0.8759124                    26                     6
    16         0.8695652                    36                     3
    17         0.8333333                     5                     2
    18         0.8266667                    16                     1
    19         0.9473684                     0                     0
    20         0.8888889                    23                     2
    21         0.8666667                    11                     0
    22         0.8641115                    38                     3
    23         0.8511327                    43                     3
    24         0.8214286                     6                     0
    25         0.9235294                    37                     2
    26         0.8980892                    36                     1
    27         0.8727273                    42                     9
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
       goalie_pk_savepct
    1          0.9375000
    2          0.8769231
    3          0.9090909
    4          0.9130435
    5          0.8750000
    6          0.8732394
    7          0.9113924
    8          1.0000000
    9          0.9390244
    10         0.9464286
    11         0.8571429
    12         0.9166667
    13         0.8181818
    14         0.9729730
    15         0.7692308
    16         0.9166667
    17         0.6000000
    18         0.9375000
    19               NaN
    20         0.9130435
    21         1.0000000
    22         0.9210526
    23         0.9302326
    24         1.0000000
    25         0.9459459
    26         0.9722222
    27         0.7857143
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

