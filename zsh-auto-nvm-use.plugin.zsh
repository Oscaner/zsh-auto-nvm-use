autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    # echo "Loading nvm version from .nvmrc"

    # Check if nvm is installed
    local nvm_version=$(nvm version "$(cat .nvmrc)")
    if echo $nvm_version | grep -q "N/A"; then
      # echo "nvm version from .nvmrc not found, installing..."
      nvm install
    fi

    nvm use --silent
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    # echo "Reverting to nvm default version"
    nvm use default --silent
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
