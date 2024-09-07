import { createRootRoute, Link, Outlet } from "@tanstack/react-router";

export const Route = createRootRoute({
  component: Layout,
});

export function Layout() {
  return (
    <div className="grid min-h-screen grid-rows-[auto_1fr_auto]">
      <header className="flex justify-between gap-2 p-2 shadow-sm">
        <Link
          to="/"
          className="flex items-center gap-1 transition-all hover:scale-105"
        >
          <img className="w-6 h-6" src="favicon.svg" alt="" />
          <h1 className="font-bold">{import.meta.env.PUBLIC_APP_TITLE}</h1>
        </Link>
        <nav className="flex gap-4">
          <Link to="/" className="[&.active]:underline">
            Home
          </Link>
          <Link to="/about" className="[&.active]:underline">
            About
          </Link>
        </nav>
      </header>

      <div>
        <Outlet />
      </div>

      <footer className="text-center shadow-inner">
        <a
          referrerPolicy="no-referrer"
          target="_blank"
          href={import.meta.env.PUBLIC_PRESENCE_ADDRESS}
        >
          {import.meta.env.PUBLIC_PRESENCE_ALIAS}
        </a>
      </footer>
    </div>
  );
}
