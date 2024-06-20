# Use official Ruby image from Docker Hub
FROM ruby:latest

# Set working directory in the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the working directory
COPY Gemfile Gemfile.lock ./

# Install dependencies specified in Gemfile
RUN bundle install

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 80 (assuming your application runs on port 80)
EXPOSE 80

# Command to run the application (adjust as needed for your setup)
CMD ["bundle", "exec", "rspec"]
