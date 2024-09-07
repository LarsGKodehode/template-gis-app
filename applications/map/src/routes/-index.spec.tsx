import { render } from "@testing-library/react";
import { describe, it } from "vitest";
import { Index } from "./index";

describe("Index Page", () => {
  it("should render without crashing", () => {
    render(<Index />);
  });
});
