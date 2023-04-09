import { useCallback, useEffect, useRef } from "react";
import SL from "../dist/sl";
import s from "./App.module.css";

function assertsIsNotNull<T>(x: T): asserts x is NonNullable<T> {
  if (x == null) {
    throw new Error(`Asserts: expected not null value.`);
  }
}

function App() {
  const refState = useRef<(() => void) | null>(null);
  const refCanvas = useRef<HTMLCanvasElement>(null);
  const onClickRun = useCallback(function onClickRun() {
    refState.current?.();
  }, []);
  useEffect(() => {
    const main = async () => {
      assertsIsNotNull(refCanvas.current);

      const sl = await SL({
        canvas: refCanvas.current,
      });
      sl.specialHTMLTargets["#canvas"] = refCanvas.current;
      const title = document.title;
      sl.callMain();
      document.title = title;

      const cols = sl._get_cols();

      let state: { t: number; x: number } | null = null;
      refState.current = () => {
        state = { t: Date.now(), x: cols };
      };

      let finished = false;
      function update() {
        if (finished) {
          return;
        }

        requestAnimationFrame(update);

        if (state == null) {
          return;
        }

        const x = (cols - 1 - (Date.now() - state.t) / 40) | 0;
        if (state.x !== x) {
          state = sl._update(x) !== -1 ? { ...state, x } : null;
        }

        return function cleanup() {
          finished = true;
        };
      }
      requestAnimationFrame(update);
    };
    main();
  }, []);
  return (
    <div className={s.container}>
      <canvas className={s.canvas} ref={refCanvas} />
      <button onClick={onClickRun} className={s.transparent} />
    </div>
  );
}

export default App;
