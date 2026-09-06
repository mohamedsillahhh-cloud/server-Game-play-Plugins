#!/usr/bin/env python3
# _merge.py <template> <target>
# Merges the 'anti-xray' block from a template into the target paper-world yml.
# Indentation-aware: adapts to the target file's indentation (2 or 4 spaces).
# Keeps everything else intact. Called by antixray-install.sh
import sys

def indent_of(line):
    return len(line) - len(line.lstrip(" "))

def is_blank(line):
    return not line.strip()

def is_comment(line):
    return line.lstrip().startswith("#")

def read_lines(p):
    with open(p, encoding="utf-8") as f:
        return f.read().splitlines()

def write_lines(p, lines):
    text = "\n".join(lines) + ("\n" if lines else "")
    with open(p, "w", encoding="utf-8", newline="\n") as f:
        f.write(text)

def reindent(body, base, target):
    out = []
    for l in body:
        if is_blank(l):
            out.append(l)
            continue
        rel = max(indent_of(l) - base, 0)
        out.append(" " * (rel + target) + l.lstrip(" "))
    return out

def block_anti_xray(tpl):
    # returns (base_indent, lines of the 'anti-xray:' subtree) from the template
    lines = read_lines(tpl)
    start = next(i for i, l in enumerate(lines) if l.strip() == "anti-xray:")
    body = lines[start:]
    while body and not body[-1].strip():
        body.pop()
    return indent_of(lines[start]), body

def children_indent(lines, parent_idx):
    p_ind = indent_of(lines[parent_idx])
    for l in lines[parent_idx + 1 :]:
        if is_blank(l) or is_comment(l):
            continue
        i = indent_of(l)
        if i <= p_ind:
            break
        return i
    return p_ind + 2

def main(tpl, target):
    ax_base, ax_body = block_anti_xray(tpl)
    lines = read_lines(target)

    idx = next((i for i, l in enumerate(lines) if l.strip() == "anti-xray:"), -1)
    if idx >= 0:
        base = indent_of(lines[idx])
        end = len(lines)
        for i in range(idx + 1, len(lines)):
            l = lines[i]
            if is_blank(l) or is_comment(l):
                continue
            if indent_of(l) <= base:
                end = i
                break
        lines = lines[:idx] + reindent(ax_body, ax_base, base) + lines[end:]
        print(f"[merge] {target}: bloco anti-xray substituido")
    else:
        ac = next((i for i, l in enumerate(lines) if l.strip() == "anticheat:"), -1)
        if ac >= 0:
            ci = children_indent(lines, ac)
            lines = lines[: ac + 1] + reindent(ax_body, ax_base, ci) + lines[ac + 1 :]
            print(f"[merge] {target}: bloco anti-xray adicionado sob anticheat:")
        else:
            lines = lines + [""] + tpl_read_full(tpl)
            print(f"[merge] {target}: bloco anticheat:/anti-xray adicionado no fim")

    write_lines(target, lines)

def tpl_read_full(tpl):
    with open(tpl, encoding="utf-8") as f:
        lines = f.read().splitlines()
    while lines and not lines[-1].strip():
        lines.pop()
    start = next(i for i, l in enumerate(lines) if l.strip() == "anticheat:")
    return lines[start:]

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])