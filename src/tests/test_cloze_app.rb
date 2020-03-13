require_relative "../modules/cloze_app"
require "test/unit"

class TestClozeApp < Test::Unit::TestCase

    def test_load_good_cloze_file
        assert_equal(ClozeApp::load("test_good.cloze"),
            [[ "Silly word" ],
             { "TEACHER" => "female", 
               "PARENT" => "male" },
             [ "TEACHER: Hello <%= @responses[0] %>." ]])
    end

    def test_load_bad_cloze_file
        assert_raise( JSON::ParserError ) { 
            ClozeApp::load("test_bad.cloze")
        }
    end
end
