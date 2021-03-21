mkdir -p ~/.config/.vim/plugged

curl -fLo "${XDG_DATA_HOME:-$HOME/.config/nvim}"/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 
npm install -g yarn

NPM_PACKAGES="vscode-css-languageserver-bin vscode-html-languageserver-bin vscode-json-languageserver typescript typescript-language-server vls prettier"

npm install -g $NPM_PACKAGES
yarn global add $NPM_PACKAGES

GO111MODULE=on go get golang.org/x/tools/gopls@latest

python3 -m pip install 'python-language-server[all]'
python3 -m pip install 'pynvim'

stow -S .
