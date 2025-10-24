# Use Python 3.11 slim image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install pipx
RUN pip install --no-cache-dir pipx && \
    pipx ensurepath

# Copy project files
COPY pyproject.toml ./
COPY analytics_mcp/ ./analytics_mcp/

# Ensure pipx is in PATH
ENV PATH="/root/.local/bin:${PATH}"

# Expose port for the MCP server (if needed)
EXPOSE 8080

# Run the MCP server using pipx
CMD ["pipx", "run", "analytics-mcp"]
