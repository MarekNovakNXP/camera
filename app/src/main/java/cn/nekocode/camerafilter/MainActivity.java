package cn.nekocode.camerafilter;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.TextureView;
import android.view.View;

public class MainActivity extends AppCompatActivity {
    private TextureView textureView;
    private CameraRenderer renderer;
    private int filterId = R.id.filter0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTitle(getString(R.string.app_name) + ": Original");

        renderer = new CameraRenderer(this);
        textureView = new TextureView(this);
        textureView.setSurfaceTextureListener(renderer);

        // Show original frame when touch the view
        textureView.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        renderer.setCameraFilter(R.id.filter0);
                        break;

                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        renderer.setCameraFilter(filterId);
                        break;
                }
                return true;
            }
        });

        setContentView(textureView);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.filter, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        filterId = item.getItemId();
        setTitle(getString(R.string.app_name) + ": " + item.getTitle());
        renderer.setCameraFilter(filterId);

        return super.onOptionsItemSelected(item);
    }
}
