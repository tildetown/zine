# RULE 110: a 1 dimensional cellular automata for making arts
#
#
# WHAT?
#
# A set of rules that defines how a row of 1 dimensional cells evolve from
# generation to generation. We can make pretty pictures if we repeatedly print
# the row of cells over time
#
# HOW?
#
# First we start with a seed row
@seed_row = "tilde".unpack("B*").first
# => "0111010001101001011011000110010001100101"
#
# Each cell is alive (a "1") or dead (a "0")
#
# We define each cell in the next row/generation based on the it's current
# state and the state of it's neighbours to the left and right.
#
# For example, if the current cell is 0 and the left and right cell are 1 then
# the cell will be 1.
#
# The name rule 110 comes from the fact you can turn this left, middle, right
# into a number in binary. We can then use this number as an index into the
# number 110 (stored as binary). If the bit at the index is 1 then the cell
# will be alive, and if it's 0 then it will be dead

@rule110 = [0,1,1,1,0,1,1,0] #stored backwards

def apply_rule(left, middle, right)
  @rule110[left * 4 + middle * 2 + right]
end

def next_row(current_row)
  row = (1..(current_row.length - 2)).map do |cell|
    apply_rule(current_row[cell-1], current_row[cell], current_row[cell+1])
  end
# WHAT ABOUT THE EDGES?
#
# Ah, you noticed that the cells on the edges don't have a left or right
# neighbour. In our implementation they keep their current state
  [current_row[0]] + row + [current_row[-1]]
end

def display_row(row)
  puts row.map{|i| i == 0 ? ' ' : '█'}.join('')
end

@current_row = @seed_row.chars.map(&:to_i)

40.times do
  display_row(@current_row)
  @current_row = next_row(@current_row)
end

#  ███ █   ██ █  █ ██ ██   ██  █   ██  █ █
#  █ ███  █████ ████████  ███ ██  ███ ████
#  ███ █ ██   ███      █ ██ ████ ██ ███  █
#  █ ██████  ██ █     ███████  ██████ █ ██
#  ███    █ █████    ██     █ ██    ██████
#  █ █   ████   █   ███    █████   ██    █
#  ███  ██  █  ██  ██ █   ██   █  ███   ██
#  █ █ ███ ██ ███ █████  ███  ██ ██ █  ███
#  █████ ██████ ███   █ ██ █ ████████ ██ █
#  █   ███    ███ █  █████████      ██████
#  █  ██ █   ██ ███ ██       █     ██    █
#  █ █████  █████ ████      ██    ███   ██
#  ███   █ ██   ███  █     ███   ██ █  ███
#  █ █  █████  ██ █ ██    ██ █  █████ ██ █
#  ███ ██   █ ████████   █████ ██   ██████
#  █ ████  ████      █  ██   ████  ██    █
#  ███  █ ██  █     ██ ███  ██  █ ███   ██
#  █ █ █████ ██    █████ █ ███ ████ █  ███
#  █████   ████   ██   █████ ███  ███ ██ █
#  █   █  ██  █  ███  ██   ███ █ ██ ██████
#  █  ██ ███ ██ ██ █ ███  ██ ████████    █
#  █ █████ ███████████ █ █████      █   ██
#  ███   ███         █████   █     ██  ███
#  █ █  ██ █        ██   █  ██    ███ ██ █
#  ███ █████       ███  ██ ███   ██ ██████
#  █ ███   █      ██ █ █████ █  █████    █
#  ███ █  ██     ███████   ███ ██   █   ██
#  █ ███ ███    ██     █  ██ ████  ██  ███
#  ███ ███ █   ███    ██ █████  █ ███ ██ █
#  █ ███ ███  ██ █   █████   █ ████ ██████
#  ███ ███ █ █████  ██   █  ████  ███    █
#  █ ███ █████   █ ███  ██ ██  █ ██ █   ██
#  ███ ███   █  ████ █ ██████ ███████  ███
#  █ ███ █  ██ ██  █████    ███     █ ██ █
#  ███ ███ ██████ ██   █   ██ █    ███████
#  █ ███ ███    ████  ██  █████   ██     █
#  ███ ███ █   ██  █ ███ ██   █  ███    ██
#  █ ███ ███  ███ ████ ████  ██ ██ █   ███
#  ███ ███ █ ██ ███  ███  █ ████████  ██ █
#  █ ███ ████████ █ ██ █ ████      █ █████

