# Imagem base
FROM postgres:16 

# Atualiza o sistema
RUN apt-get update && apt-get upgrade -y 

# Instala o pacote de localização
RUN apt-get install -y locales locales-all 

# Habilita a localização pt_BR.UTF-8
RUN sed -i '/pt_BR.UTF-8/s/^# //g' /etc/locale.gen 

# Gera a localização pt_BR.UTF-8
RUN locale-gen # Gera a localização pt_BR.UTF-8 

# Define a localização pt_BR.UTF-8
ENV LANG=pt_BR.UTF-8 \          
    LANGUAGE=pt_BR:pt \
    LC_ALL=pt_BR.UTF-8 \
    TZ=America/Fortaleza                

# Comando padrão
CMD ["docker-entrypoint.sh", "postgres"]    

# Limpa o cache do apt-get
RUN apt-get clean                           