import { describe, it } from "vitest";
import { render } from "@testing-library/react";
import { About } from "./about";

describe("About Page Component", () => {
  it("should render without crashing", () => {
    render(<About />);
  });
});
