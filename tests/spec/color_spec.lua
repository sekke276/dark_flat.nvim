local dark_flat = require "dark_flat"

describe("Override config with color utility", function()
    it("could use darken utility", function()
        local expected = {
            colors = {
                lmao = "#812873",
            },
            themes = function(c)
                return {
                    Normal = { fg = c.lmao:darken(0.5) },
                }
            end,
        }

        dark_flat.setup(expected)

        local hl = vim.api.nvim_get_hl(0, { name = "Normal" })

        assert.equal("#41143a", ("#%06x"):format(hl.fg))
    end)
end)
