import Hedetniemi.Round4.CertificateIdentitiesP00
import Hedetniemi.Round4.CertificateIdentitiesP01
import Hedetniemi.Round4.CertificateIdentitiesP02
import Hedetniemi.Round4.CertificateIdentitiesP03
import Hedetniemi.Round4.CertificateIdentitiesP04
import Hedetniemi.Round4.CertificateIdentitiesP05
import Hedetniemi.Round4.CertificateIdentitiesP06
import Hedetniemi.Round4.CertificateIdentitiesP07
import Hedetniemi.Round4.CertificateIdentitiesP08
import Hedetniemi.Round4.CertificateIdentitiesP09
import Hedetniemi.Round4.CertificateIdentitiesP10
import Hedetniemi.Round4.CertificateIdentitiesP11
import Hedetniemi.Round4.CertificateIdentitiesP12
import Hedetniemi.Round4.CertificateIdentitiesP13
import Hedetniemi.Round4.CertificateIdentitiesP14
import Hedetniemi.Round4.CertificateIdentitiesP15
import Hedetniemi.Round4.CertificateIdentitiesP16
import Hedetniemi.Round4.CertificateIdentitiesP17
import Hedetniemi.Round4.CertificateIdentitiesP18
import Hedetniemi.Round4.CertificateIdentitiesP19
import Hedetniemi.Round4.CertificateIdentitiesP20
import Hedetniemi.Round4.CertificateIdentitiesP21
import Hedetniemi.Round4.CertificateIdentitiesP22
import Hedetniemi.Round4.CertificateIdentitiesP23
import Hedetniemi.Round4.CertificateIdentitiesP24

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

theorem all_entry_rows (i : Fin 197) : ∀ (a : Fin 4) (j : Fin 197),
    blockEntry a i j = blockEntry a j i ∧
    blockEntry a i j = blockFormulaN a.val i.val j.val := by
  fin_cases i
  · exact checked_entry_row_0
  · exact checked_entry_row_1
  · exact checked_entry_row_2
  · exact checked_entry_row_3
  · exact checked_entry_row_4
  · exact checked_entry_row_5
  · exact checked_entry_row_6
  · exact checked_entry_row_7
  · exact checked_entry_row_8
  · exact checked_entry_row_9
  · exact checked_entry_row_10
  · exact checked_entry_row_11
  · exact checked_entry_row_12
  · exact checked_entry_row_13
  · exact checked_entry_row_14
  · exact checked_entry_row_15
  · exact checked_entry_row_16
  · exact checked_entry_row_17
  · exact checked_entry_row_18
  · exact checked_entry_row_19
  · exact checked_entry_row_20
  · exact checked_entry_row_21
  · exact checked_entry_row_22
  · exact checked_entry_row_23
  · exact checked_entry_row_24
  · exact checked_entry_row_25
  · exact checked_entry_row_26
  · exact checked_entry_row_27
  · exact checked_entry_row_28
  · exact checked_entry_row_29
  · exact checked_entry_row_30
  · exact checked_entry_row_31
  · exact checked_entry_row_32
  · exact checked_entry_row_33
  · exact checked_entry_row_34
  · exact checked_entry_row_35
  · exact checked_entry_row_36
  · exact checked_entry_row_37
  · exact checked_entry_row_38
  · exact checked_entry_row_39
  · exact checked_entry_row_40
  · exact checked_entry_row_41
  · exact checked_entry_row_42
  · exact checked_entry_row_43
  · exact checked_entry_row_44
  · exact checked_entry_row_45
  · exact checked_entry_row_46
  · exact checked_entry_row_47
  · exact checked_entry_row_48
  · exact checked_entry_row_49
  · exact checked_entry_row_50
  · exact checked_entry_row_51
  · exact checked_entry_row_52
  · exact checked_entry_row_53
  · exact checked_entry_row_54
  · exact checked_entry_row_55
  · exact checked_entry_row_56
  · exact checked_entry_row_57
  · exact checked_entry_row_58
  · exact checked_entry_row_59
  · exact checked_entry_row_60
  · exact checked_entry_row_61
  · exact checked_entry_row_62
  · exact checked_entry_row_63
  · exact checked_entry_row_64
  · exact checked_entry_row_65
  · exact checked_entry_row_66
  · exact checked_entry_row_67
  · exact checked_entry_row_68
  · exact checked_entry_row_69
  · exact checked_entry_row_70
  · exact checked_entry_row_71
  · exact checked_entry_row_72
  · exact checked_entry_row_73
  · exact checked_entry_row_74
  · exact checked_entry_row_75
  · exact checked_entry_row_76
  · exact checked_entry_row_77
  · exact checked_entry_row_78
  · exact checked_entry_row_79
  · exact checked_entry_row_80
  · exact checked_entry_row_81
  · exact checked_entry_row_82
  · exact checked_entry_row_83
  · exact checked_entry_row_84
  · exact checked_entry_row_85
  · exact checked_entry_row_86
  · exact checked_entry_row_87
  · exact checked_entry_row_88
  · exact checked_entry_row_89
  · exact checked_entry_row_90
  · exact checked_entry_row_91
  · exact checked_entry_row_92
  · exact checked_entry_row_93
  · exact checked_entry_row_94
  · exact checked_entry_row_95
  · exact checked_entry_row_96
  · exact checked_entry_row_97
  · exact checked_entry_row_98
  · exact checked_entry_row_99
  · exact checked_entry_row_100
  · exact checked_entry_row_101
  · exact checked_entry_row_102
  · exact checked_entry_row_103
  · exact checked_entry_row_104
  · exact checked_entry_row_105
  · exact checked_entry_row_106
  · exact checked_entry_row_107
  · exact checked_entry_row_108
  · exact checked_entry_row_109
  · exact checked_entry_row_110
  · exact checked_entry_row_111
  · exact checked_entry_row_112
  · exact checked_entry_row_113
  · exact checked_entry_row_114
  · exact checked_entry_row_115
  · exact checked_entry_row_116
  · exact checked_entry_row_117
  · exact checked_entry_row_118
  · exact checked_entry_row_119
  · exact checked_entry_row_120
  · exact checked_entry_row_121
  · exact checked_entry_row_122
  · exact checked_entry_row_123
  · exact checked_entry_row_124
  · exact checked_entry_row_125
  · exact checked_entry_row_126
  · exact checked_entry_row_127
  · exact checked_entry_row_128
  · exact checked_entry_row_129
  · exact checked_entry_row_130
  · exact checked_entry_row_131
  · exact checked_entry_row_132
  · exact checked_entry_row_133
  · exact checked_entry_row_134
  · exact checked_entry_row_135
  · exact checked_entry_row_136
  · exact checked_entry_row_137
  · exact checked_entry_row_138
  · exact checked_entry_row_139
  · exact checked_entry_row_140
  · exact checked_entry_row_141
  · exact checked_entry_row_142
  · exact checked_entry_row_143
  · exact checked_entry_row_144
  · exact checked_entry_row_145
  · exact checked_entry_row_146
  · exact checked_entry_row_147
  · exact checked_entry_row_148
  · exact checked_entry_row_149
  · exact checked_entry_row_150
  · exact checked_entry_row_151
  · exact checked_entry_row_152
  · exact checked_entry_row_153
  · exact checked_entry_row_154
  · exact checked_entry_row_155
  · exact checked_entry_row_156
  · exact checked_entry_row_157
  · exact checked_entry_row_158
  · exact checked_entry_row_159
  · exact checked_entry_row_160
  · exact checked_entry_row_161
  · exact checked_entry_row_162
  · exact checked_entry_row_163
  · exact checked_entry_row_164
  · exact checked_entry_row_165
  · exact checked_entry_row_166
  · exact checked_entry_row_167
  · exact checked_entry_row_168
  · exact checked_entry_row_169
  · exact checked_entry_row_170
  · exact checked_entry_row_171
  · exact checked_entry_row_172
  · exact checked_entry_row_173
  · exact checked_entry_row_174
  · exact checked_entry_row_175
  · exact checked_entry_row_176
  · exact checked_entry_row_177
  · exact checked_entry_row_178
  · exact checked_entry_row_179
  · exact checked_entry_row_180
  · exact checked_entry_row_181
  · exact checked_entry_row_182
  · exact checked_entry_row_183
  · exact checked_entry_row_184
  · exact checked_entry_row_185
  · exact checked_entry_row_186
  · exact checked_entry_row_187
  · exact checked_entry_row_188
  · exact checked_entry_row_189
  · exact checked_entry_row_190
  · exact checked_entry_row_191
  · exact checked_entry_row_192
  · exact checked_entry_row_193
  · exact checked_entry_row_194
  · exact checked_entry_row_195
  · exact checked_entry_row_196

theorem concrete_block_symmetry (a : Fin 4) (i j : Fin 197) :
    blockEntry a i j = blockEntry a j i := (all_entry_rows i a j).1

theorem concrete_block_transform (a : Fin 4) (i j : Fin 197) :
    blockEntry a i j = ∑ s : Fin 4, walshInt a s * kernelEntry s i j :=
  (all_entry_rows i a j).2.trans (blockFormulaN_eq a i j)

end Hedetniemi.Round4
