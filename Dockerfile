FROM mcr.microsoft.com/mssql/server:2022-latest

# Chạy với quyền root để cài đặt các gói
USER root

# Cài đặt mssql-tools và các gói phụ thuộc
RUN apt-get update && \
    apt-get install -y curl apt-transport-https && \
    curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc && \
    curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | tee /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

# Chạy SQL Server
CMD ["/opt/mssql/bin/sqlservr"]
