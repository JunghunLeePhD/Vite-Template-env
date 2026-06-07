FROM node:20-alpine

RUN apk update && apk add git openssh zsh

WORKDIR /app

RUN { \
  echo "parse_git_branch() { git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p' }"; \
  echo "COLOR_DEF='%f'"; \
  echo "COLOR_USR='%F{243}'"; \
  echo "COLOR_DIR='%F{197}'"; \
  echo "COLOR_GIT='%F{39}'"; \
  echo "NEWLINE=$'\n'"; \
  echo "setopt PROMPT_SUBST"; \
  echo "export PROMPT='\${COLOR_USR}%n \${COLOR_DIR}%1~ \${COLOR_GIT}\$(parse_git_branch)\${COLOR_DEF}%% '"; \
} >> /root/.zshrc

EXPOSE 5173