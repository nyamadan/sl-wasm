type Err = -1;
type Ok = 0;

interface Module extends EmscriptenModule {
  callMain(args?: readonly string[]): number;
  specialHTMLTargets: any[] & { "#canvas": HTMLCanvasElement | undefined };
  _get_cols(): number;
  _get_lines(): number;
  _update(x: number): Ok | Err;
  _stop(): void;
}

interface ModuleOptions {
  canvas?: HTMLCanvasElement;
}
function Module(options?: ModuleOptions): Promise<Module>;
export default Module;
