require "spec_helper"
require "maui_support/maui_helper"

describe MauiHelper do
  describe ".white_list_params" do
    it "converts white-listed to symbolized keys" do
      params_hash = {
        a: nil,
        b: nil,
        c: nil,
        d: {
          e: nil,
          f: nil,
          g: nil
        },
        h: nil,
        i: nil
      }

      the_params = {
        "utf8" => "✓",
        "_method" => "patch",
        "a" => "AA",
        "b" => "BB",
        "c" => "CC",
        "d" => {
          "e" => "EE",
          "f" => "FF",
          "g" => "GG"
        },
        "h" => "HH",
        "i" => "II",
        "controller" => "users_controller",
        "action" => "edit"
      }

      result = MauiHelper.white_list_params(params_hash, the_params)
      expected = {
        "a" => "AA",
        "b" => "BB",
        "c" => "CC",
        "d" => {
          "e" => "EE",
          "f" => "FF",
          "g" => "GG"
        },
        "h" => "HH",
        "i" => "II" }.deep_symbolize_keys
      expect(result).to match(expected)
    end
  end
end
