export class ObjectUtil {
  static Assign<T extends {}, U>(target: T, source: U): T & U {
    return Object.assign(target, source);
  }
}

export function deepCopy(obj: ESObject): ESObject {
  if (typeof obj !== 'object' || obj === null) {
    return obj;
  }
  let copy: ESObject;
  if (Array.isArray(obj)) {
    copy = [];
    for (let i = 0; i < obj.length; i++) {
      copy[i] = deepCopy(obj[i]);
    }
  } else {
    copy = {};
    for (let i = 0; i < obj.length(); i++) {
      let key: ESObject = obj[i];
      if (obj.hasOwnProperty(key)) {
        copy[key] = deepCopy(obj[key]);
      }
    }
  }
  return copy;
}