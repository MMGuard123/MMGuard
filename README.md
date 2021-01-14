# MMGuard
This is the artefact of paper "MMGuard: Automatically Protecting On-DeviceDeep Learning Models in Android Apps"

## usage
use TensorFlow 2.0\
put the original apk in data/apk and run command:
```
python main.py file_path signature selected_layer
example : python main.py data/ 0110 1
```
The input of MMGuard is the original app embedded with unprotected model , and the output is the app embedded with protected DNN model.