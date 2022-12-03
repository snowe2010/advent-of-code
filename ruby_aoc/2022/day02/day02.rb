# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'


# every option has a unique score
# BX=1+0=1
# AX=1+3=4
# CX=1+6=7
# CY=2+0=2
# BY=2+3=5
# AY=2+6=8
# AZ=3+0=3
# CZ=3+3=6
# BZ=3+6=9
# reordered
# BX=1+0=1
# CY=2+0=2
# AZ=3+0=3
# AX=1+3=4
# BY=2+3=5
# CZ=3+3=6
# CX=1+6=7
# AY=2+6=8
# BZ=3+6=9
execute(1) do |lines|
  lines.map{|i| %w(BX CY AZ AX BY CZ CX AY BZ).index(i.tr(' ',''))+1}.sum
end

execute(2) do |lines|
  lines.map{|i| %w(BX CX AX AY BY CY CZ AZ BZ).index(i.tr(' ',''))+1}.sum
end
