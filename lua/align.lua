local M = {}

function M.align(pat)
    local top, bot = vim.fn.getpos("'<"), vim.fn.getpos("'>")
    M.align_lines(pat, top[2]-1, bot[2])
    vim.fn.setpos("'<", top)
    vim.fn.setpos("'>", bot)
end

function M.align_lines(pat, startline, endline)
    local re = vim.regex(pat)
    local max = -1
    local lines = vim.api.nvim_buf_get_lines(0, startline, endline, false)
    for _, line in pairs(lines) do
        local s = re:match_str(line)
        if s and max < s then
            max = s
        end
    end

    if max == -1 then return end

    for i, line in pairs(lines) do
        local s = re:match_str(line)
        if s then
            local rep = max - s
            local newline = {
                string.sub(line, 1, s),
                string.rep(' ', rep),
                string.sub(line, s+1),
            }
            lines[i] = table.concat(newline)
        end
    end

    vim.api.nvim_buf_set_lines(0, startline, endline, false, lines)
end

return M
