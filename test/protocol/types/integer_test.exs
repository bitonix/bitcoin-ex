defmodule BitcoinTest.Protocol.Types.IntegerTest do
  use ExUnit.Case

  alias Bitcoin.Protocol.Types.Integer

  test "unpacks var-int 64-bit native 0xFF w/ remaining" do

    payload = <<255, 43, 221, 215, 77, 0, 0, 0, 0, 1, 1, 0>>

    assert [1305992491, <<1, 1, 0>>] ==
             Integer.parse_stream(payload)

  end

  test "unpacks var-int 32-bit little 0xFE w/ remaining" do

    payload = <<254, 43, 221, 215, 77, 0, 1, 0>>

    assert [1305992491, <<0, 1, 0>>] ==
             Integer.parse_stream(payload)

  end

  test "unpacks var-int 16-bit little 0xFD w/ remaining" do

    payload = <<253, 43, 221, 0, 1, 0>>

    assert [56619, <<0, 1, 0>>] ==
             Integer.parse_stream(payload)

  end

  test "unpacks var-int 8-bit w/ remaining" do

    payload = <<0xF0, 0, 1, 0>>

    assert [0xF0, <<0, 1, 0>>] ==
             Integer.parse_stream(payload)

  end

  test "unpacks var-int 64-bit native 0xFF w/o remaining" do

    payload = <<255, 43, 221, 215, 77, 0, 0, 0, 0>>

    assert 1305992491 ==
             Integer.parse(payload)

  end

  test "unpacks var-int 32-bit little 0xFE w/o remaining" do

    payload = <<254, 43, 221, 215, 77>>

    assert 1305992491 ==
             Integer.parse(payload)

  end

  test "unpacks var-int 16-bit little 0xFD w/o remaining" do

    payload = <<253, 43, 221>>

    assert 56619 ==
             Integer.parse(payload)

  end

  test "unpacks var-int 8-bit w/o remaining" do

    payload = <<0xF0>>

    assert 0xF0 ==
             Integer.parse(payload)

  end

end