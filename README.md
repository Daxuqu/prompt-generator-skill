# prompt-generator skill

一个可复用的 Codex skill，用来把模糊想法整理成结构清晰、低幻觉、可直接执行的高质量提示词。

仓库地址：

- SSH: `git@github.com:Daxuqu/prompt-generator-skill.git`
- HTTPS: `https://github.com/Daxuqu/prompt-generator-skill.git`

## 一键安装

有 Git 权限时，直接执行：

```bash
git clone https://github.com/Daxuqu/prompt-generator-skill.git
cd prompt-generator-skill
./install.sh
```

安装完成后重启 Codex。

## 仓库结构

```text
.
├── prompt-generator/
│   ├── SKILL.md
│   └── agents/
│       └── openai.yaml
└── install.sh
```

## 在另一台电脑上使用

### 方式 1：clone 后安装

```bash
git clone https://github.com/Daxuqu/prompt-generator-skill.git
cd prompt-generator-skill
./install.sh
```

默认会安装到：

```bash
~/.codex/skills/prompt-generator
```

如果你设置过 `CODEX_HOME`，脚本会自动安装到：

```bash
$CODEX_HOME/skills/prompt-generator
```

### 方式 2：手动复制

把仓库里的 `prompt-generator/` 整个目录复制到目标机器的 Codex skills 目录：

```bash
~/.codex/skills/
```

复制完成后，重启 Codex。

## 使用方式

在对话中显式调用：

```text
[$prompt-generator]
```

或者直接提出类似这些需求：

- 帮我写一个提示词
- 优化这个 prompt
- 做一个低幻觉提示词模板
- 帮我把需求改造成 agent prompt

## 更新 skill

如果你更新了 `prompt-generator/SKILL.md` 或 `prompt-generator/agents/openai.yaml`：

```bash
git add .
git commit -m "Update prompt-generator skill"
git push
```

另一台电脑上执行：

```bash
git pull
./install.sh
```
