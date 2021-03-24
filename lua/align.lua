local M = {}

function M.align(pat)
    local re = vim.regex(pat)
    local top, bot = vim.fn.getpos("'<"), vim.fn.getpos("'>")

    local max = -1
    local lines = vim.api.nvim_buf_get_lines(0, top[2]-1, bot[2], false)
    for i, line in pairs(lines) do
        line = string.gsub(line, '%s*'..pat, ' '..pat, 1)
        lines[i] = line
        local s = re:match_str(line)
        -- local s = string.find(line, pat)
        if s and max < s then
            max = s
        end
    end

    if max == -1 then return end

    for i, line in pairs(lines) do
        local s = re:match_str(line)
        if s then
            local rep = max - s + 1
            local newline = {
                string.sub(line, 1, s-1),
                string.rep(' ', rep),
                string.sub(line, s+1),
            }
            lines[i] = table.concat(newline)
        end
    end

    vim.api.nvim_buf_set_lines(0, top[2]-1, bot[2], false, lines)
    vim.fn.setpos("'<", top)
    vim.fn.setpos("'>", bot)
end

return M
