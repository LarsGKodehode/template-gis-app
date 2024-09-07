/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly PUBLIC_APP_TITLE: string;
  readonly PUBLIC_PRESENCE_ALIAS: string;
  readonly PUBLIC_PRESENCE_ADDRESS: string;
  readonly PUBLIC_BACKEND_ADDRESS: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
