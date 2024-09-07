/// <reference types="node" />
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";
import { TanStackRouterVite } from "@tanstack/router-plugin/vite";

const isTestEnvironment = process.env.NODE_ENV === "test";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [!isTestEnvironment && TanStackRouterVite(), react()],
  envPrefix: "PUBLIC_",
});
