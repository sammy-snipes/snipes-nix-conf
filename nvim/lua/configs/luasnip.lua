local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local c = ls.choice_node
local i = ls.insert_node

-- connect to snowflake
-- ls.add_snippets("python", {
--     s("ctsf", {
--         t({
--             "from scylla.constants_developer import developer_sf_config",
--             "from scylla.io.snowflake import Snowflake",
--             "sf = Snowflake.from_dev_config(developer_sf_config, telemetry=False)",
--             'sf.use_wh_of_size("m")',
--             "session = sf.session",
--         }),
--     }),
-- })
--
-- -- section
-- ls.add_snippets("python", {
--     ls.snippet("#####", {
--         ls.text_node({ string.rep("#", 15) .. " " }),
--         ls.insert_node(1, ""), -- Cursor placed in the middle as placeholder
--         ls.text_node({ " " .. string.rep("#", 15) }),
--     }),
-- })
