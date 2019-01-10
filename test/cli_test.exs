defmodule CLITest do
  use ExUnit.Case
  import CLI
  import Marks
  import Globals, only: [newline: 0]

  @empty_board List.duplicate(empty_mark(), 9)
  @formatted_empty_board ~s{[1] [2] [3] \r\n[4] [5] [6] \r\n[7] [8] [9] \r\n}
  @formatted_marked_board_1 ~s{[1] [2] [X] \r\n[4] [O] [6] \r\n[7] [8] [9] \r\n}
  @formatted_marked_board_2 ~s{[1] [2] [3] \r\n[O] [X] [X] \r\n[7] [8] [O] \r\n}

  @marked_board_1 @empty_board
                  |> List.replace_at(2, player_one_mark())
                  |> List.replace_at(4, player_two_mark())

  @marked_board_2 @empty_board
                  |> List.replace_at(3, player_two_mark())
                  |> List.replace_at(4, player_one_mark())
                  |> List.replace_at(5, player_one_mark())
                  |> List.replace_at(8, player_two_mark())

  test "format empty board" do
    assert format_board(@empty_board) == @formatted_empty_board
  end

  test "format marked board" do
    assert format_board(@marked_board_1) == @formatted_marked_board_1
    assert format_board(@marked_board_2) == @formatted_marked_board_2
  end

  test "cleans number" do
    assert clean_number("0\n") == 0
  end
end
