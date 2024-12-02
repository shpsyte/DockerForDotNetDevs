# This Dockerfile is used to build the Docker image for the API project
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
# Setting the working directory to /app
WORKDIR /app
# Copying the project file to the working directory
COPY ["DockerAPI.csproj", "DockerAPI/"]
# Restoring the dependencies
RUN dotnet restore "DockerAPI.csproj"
# The layer will be cached if there are no changes in the project file


## Copying the entire project to the working directory
COPY . .
#
## Changing the working directory to the API project
WORKDIR "/app/DockerAPI"
#
## Building the project
RUN dotnet publish "DockerAPI.csproj" -c Release -o /app/publish /p:UseAppHost=false

## Building the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
## Setting the working directory to /app
WORKDIR /app

## Exposing the ports
#EXPOSE 5047

ENV ASPNETCORE_URLS=http://+:5000
## Copying the published files to the working directory
COPY --from=build /app/publish .
## Running the application
ENTRYPOINT ["dotnet", "DockerAPI.dll"]
