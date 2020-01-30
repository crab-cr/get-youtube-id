require "./spec_helper"

describe Iom::GetYoutubeId do

  it "match example cases" do
    [
      { "expected_id" => "-wtIMTCHWuI", "url" => "http://www.youtube.com/watch?v=-wtIMTCHWuI" },
      { "expected_id" => "-wtIMTCHWuI", "url" => "http://www.youtube.com/v/-wtIMTCHWuI?version=3&autohide=1" },
      { "expected_id" => "-wtIMTCHWuI", "url" => "http://youtu.be/-wtIMTCHWuI" },
      { "expected_id" => "zc0s358b3Ys", "url" => "http://www.youtube.com/embed/zc0s358b3Ys" },
      { "expected_id" => "-wtIMTCHWuI", "url" => " http://www.youtube.com/watch?v=-wtIMTCHWuI " },
      { "expected_id" => "zc0s358b3Ys", "url" => "http://youtu.be/zc0s358b3Ys" },
      { "expected_id" => "u8nQa1cJyX8", "url" => "http://www.youtube.com/watch?v=u8nQa1cJyX8&a=GxdCwVVULXctT2lYDEPllDR0LRTutYfW" },
      { "expected_id" => "u8nQa1cJyX8", "url" => "http://www.youtube.com/watch?v=u8nQa1cJyX8" },
      { "expected_id" => "zc0s358b3Ys", "url" => "http://youtu.be/zc0s358b3Ys" },
      { "expected_id" => "zc0s358b3Ys", "url" => "http://youtu.be/zc0s358b3Ys" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://www.youtube.com/watch?v=0zM3nApSvMg&feature=feedrec_grec_index" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://www.youtube.com/v/0zM3nApSvMg?fs=1&amp;hl=en_US&amp;rel=0" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://www.youtube.com/watch?v=0zM3nApSvMg#t=0m10s" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://www.youtube.com/embed/0zM3nApSvMg?rel=0" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://www.youtube.com/watch?v=0zM3nApSvMg" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://youtu.be/0zM3nApSvMg" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://www.youtube.com/v/0zM3nApSvMg?fs=1&amp;hl=en_US&amp;rel=0" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://www.youtube.com/embed/0zM3nApSvMg?rel=0" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://www.youtube.com/watch?v=0zM3nApSvMg&feature=feedrec_grec_index" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://www.youtube.com/watch?v=0zM3nApSvMg" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://youtu.be/0zM3nApSvMg" },
      { "expected_id" => "0zM3nApSvMg", "url" => "http://www.youtube.com/watch?v=0zM3nApSvMg#t=0m10s" },
      { "expected_id" => "QdK8U-VIH_o", "url" => "http://www.youtube.com/user/IngridMichaelsonVEVO#p/a/u/1/QdK8U-VIH_o" },
      { "expected_id" => "LXilEPmkoQY", "url" => "http://www.youtube.com/embed/LXilEPmkoQY" },
      { "expected_id" => "LXilEPmkoQY", "url" => "http://www.youtube.com/v/LXilEPmkoQY" },
      { "expected_id" => "u8nQa1cJyX8", "url" => "http://www.youtube.com/watch?argv=xyzxyzxyzxy&v=u8nQa1cJyX8" },
      { "expected_id" => "0zM3nApSvMg", "url" => "youtube.com/watch?feature=feedrec_grec_index&v=0zM3nApSvMg " },
      { "expected_id" => "y_Rd2hByRyc", "url" => "http://www.youtube.com/watch?feature=player_embedded&v=y_Rd2hByRyc" },
    ].each do |scenario|
      actual_id = Iom::GetYoutubeId.get_youtube_id scenario["url"]
      actual_id.should eq scenario["expected_id"]
      # false.should eq(true)
    end
  end

  it "handles nil" do
    actual_id = Iom::GetYoutubeId.get_youtube_id nil
    actual_id.should eq nil

    actual_id = Iom::GetYoutubeId.get_youtube_ids nil
    actual_id.should eq Set(String).new
  end

  it "can get all youtube ids from a string" do
    scenario_text = "Checkout out this cool videoa http://www.youtube.com/watch?v=-wtIMTCHWuI
    and accidentally the same one again http://www.youtube.com/v/-wtIMTCHWuI?version=3&autohide=1
    and another one http://www.youtube.com/embed/zc0s358b3Ys
    one more  http://www.youtube.com/watch?v=u8nQa1cJyX8&a=GxdCwVVULXctT2lYDEPllDR0LRTutYfW
    but also http://www.youtube.com/watch?v=0zM3nApSvMg&feature=feedrec_grec_index
    in addition to http://www.youtube.com/embed/LXilEPmkoQY
    and http://www.youtube.com/watch?argv=xyzxyzxyzxy&v=u8nQa1cJyX8
    youtube.com/watch?feature=feedrec_grec_index&v=0zM3nApSvMg
    with http://www.youtube.com/watch?feature=player_embedded&v=y_Rd2hByRyc"

    expected_set = Set{
      "-wtIMTCHWuI",
      "zc0s358b3Ys",
      "u8nQa1cJyX8",
      "0zM3nApSvMg",
      "LXilEPmkoQY",
      "y_Rd2hByRyc",
    }

    actual_set = Iom::GetYoutubeId.get_youtube_ids scenario_text
    actual_set.should eq expected_set
  end
end
