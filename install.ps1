$ScriptDir = pwd

# Ripgrep
$RipgrepDir = "$Home\.local\ripgrep"
if (!(Test-Path -Path $RipgrepDir)) {
    mkdir -p $RipgrepDir
}
cd $RipgrepDir

if (Test-Path -Path ripgrep) {
    Remove-Item ripgrep -Recurse -Force -Confirm:$false
}
wget -O ripgrep.zip https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-pc-windows-msvc.zip
Expand-Archive -DestinationPath ripgrep ripgrep.zip
mv ripgrep/ripgrep-13.0.0-x86_64-pc-windows-msvc ripgrep/ripgrep
rm ripgrep.zip
cd $ScriptDir

# lazygit
$LazygitDir = "$Home\.local\lazygit"
if (!(Test-Path -Path $LazygitDir)) {
    mkdir -p $LazygitDir
}
cd $LazygitDir

if (Test-Path -Path lazygit) {
    Remove-Item lazygit -Recurse -Force -Confirm:$false
}
wget -O lazygit.zip https://github.com/jesseduffield/lazygit/releases/download/v0.36.0/lazygit_0.36.0_Windows_x86_64.zip
Expand-Archive -DestinationPath lazygit lazygit.zip
rm lazygit.zip
cd $ScriptDir

# Nvim
$NvimDir = "$Home\.local\nvim"
if (!(Test-Path -Path $NvimDir)) {
    mkdir -p $NvimDir
}
cd $NvimDir

if (Test-Path -Path nvim) {
    Remove-Item nvim -Recurse -Force -Confirm:$false
}
wget -O nvim.zip https://github.com/neovim/neovim/releases/download/stable/nvim-win64.zip
Expand-Archive nvim.zip
rm nvim.zip
cd $ScriptDir

# Nvim config
$NvimConfigDir = "$Home\AppData\Local\nvim"
if (!(Test-Path -Path $NvimConfigDir)) {
    mkdir -p $NvimConfigDir
}
cd $NvimConfigDir

Remove-Item * -Recurse -Force -Confirm:$false
cp -r $ScriptDir\nvim\* .

"" > update
cd $ScriptDir
